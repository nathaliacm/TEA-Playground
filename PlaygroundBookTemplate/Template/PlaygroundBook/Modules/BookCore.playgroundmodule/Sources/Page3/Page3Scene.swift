//
//  Page3Scene.swift
//  BookCore
//
//  Created by Nathalia Cardoso on 15/04/21.
//

import Foundation
import SpriteKit
import PlaygroundSupport

public class Page3Scene: SKScene {
    
    public var cellPhone = SKSpriteNode()
    public var cellPhoneDropFrames: [SKTexture] = []
    
    public var boy = SKSpriteNode()
    public var boyWalkFrames: [SKTexture] = []
    
    let makeaWayButton = SKSpriteNode(imageNamed: "makeaWayButton")
    let downButton = SKSpriteNode(imageNamed: "downButton")
    
    //public var background = SKSpriteNode()
    //public var backgroundFrames: [SKTexture] = []
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(named: "background-color") ?? .gray
        self.setupBackground()
        //buildBackground()
        //animateBackground()
        buildCellPhone()
        buildBoy()
        setupTitle()
        setupButtons()
    }
    
    public func setupBackground() {
        let background = SKSpriteNode(imageNamed: "cliff")
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
    }
    
    func setupTitle() {
        let objective = SKLabelNode(fontNamed: "SFProRounded-Semibold")
        objective.text = "Choose the right button!"
        objective.fontSize = 50
        objective.fontColor = SKColor.black
        objective.position = CGPoint(x: frame.midX, y: self.size.height*0.37)

        addChild(objective)
    }
    
    func buildCellPhone() {
        let cellPhoneAnimatedAtlas = SKTextureAtlas(named: "cellPhoneImages")
        var dropFrames: [SKTexture] = []
        
        let numImages = cellPhoneAnimatedAtlas.textureNames.count
        
        for i in 1...numImages {
            let cellPhoneTextureName = "cellPhone\(i)"
            dropFrames.append(cellPhoneAnimatedAtlas.textureNamed(cellPhoneTextureName))
        }
        cellPhoneDropFrames = dropFrames
        
        let firstFrameTexture = cellPhoneDropFrames[0]
        cellPhone = SKSpriteNode(texture: firstFrameTexture)
        cellPhone.position = CGPoint(x: frame.width*0.05, y: frame.height*0.14842579)
        addChild(cellPhone)
    }
    
    func buildBoy() {
        let boyAnimatedAtlas = SKTextureAtlas(named: "boyImages")
        var walkFrames: [SKTexture] = []
        
        let numImages = boyAnimatedAtlas.textureNames.count
        
        for i in 1...numImages {
            let boyTextureName = "boy\(i)"
            walkFrames.append(boyAnimatedAtlas.textureNamed(boyTextureName))
        }
        boyWalkFrames = walkFrames
        
        let firstFrameTexture = boyWalkFrames[0]
        boy = SKSpriteNode(texture: firstFrameTexture)
        boy.position = CGPoint(x: -frame.width*0.39866667, y: frame.height*0.13793103)
        addChild(boy)
    }
    
    func animateBoy() {
        boyWalkFrames.remove(at: 0)
        boy.run(SKAction.repeat(SKAction.animate(with: boyWalkFrames, timePerFrame: 0.6, resize: false, restore: false), count: 1))

    }
    
    func setupButtons(){
        let len = CGSize(width: self.frame.width*0.33501333, height: self.frame.height*0.05555)
        makeaWayButton.size = len
        makeaWayButton.position = CGPoint(x: self.frame.width*0.23066667, y: -self.frame.height*0.33)
        makeaWayButton.name = "makeaWayButton"
        
        downButton.size = len
        downButton.position = CGPoint(x: -self.frame.width*0.23066667, y: -self.frame.height*0.33)
        downButton.name = "downButton"
        
        addChild(makeaWayButton)
        addChild(downButton)
    }
    
    func animateCellPhone() {
        boy.texture = boyWalkFrames[1]
        let dropAction = SKAction.repeat(SKAction.animate(with: cellPhoneDropFrames, timePerFrame: 0.1, resize: false, restore: false), count: 1)

        let doneAction = SKAction.run({ [weak self] in
            self?.animateBoy()
            self?.moveBoy()
        })
        
        let moveActionWithDone = SKAction.sequence([dropAction, doneAction])
        cellPhone.run(moveActionWithDone, withKey:"cellPhoneMoving")

    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            if (self.atPoint(location).name == "makeaWayButton") {
                self.makeaWayButton.yScale = 1.01
                self.animateCellPhone()
            }

            if (self.atPoint(location).name == "downButton") {
                self.downButton.yScale = 1.01
                self.cellPhone.xScale = 1.01
                self.cellPhone.yScale = 1.01
            }
            
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.makeaWayButton.yScale = 1.0
        self.downButton.yScale = 1.0
        self.cellPhone.xScale = 1.0
        self.cellPhone.yScale = 1.0
        if let location = touches.first?.location(in: self) {
            if (self.atPoint(location).name == "makeaWayButton") {
                downButton.alpha = 0.6
                makeaWayButton.alpha = 0.6
                self.isUserInteractionEnabled = false
                PlaygroundPage.current.assessmentStatus = .none
                
            }
            if (self.atPoint(location).name == "downButton") {
                PlaygroundPage.current.assessmentStatus = .fail(hints: ["It's not right, try another button!"], solution: "make a way button")
            }
        }
    }
    
    func moveBoy() {
        let location = CGPoint(x: frame.width*0.4, y: frame.height*0.13793103)
        let boySpeed = frame.size.width / 10.5
        let moveDifference = CGPoint(x: location.x - boy.position.x, y: location.y - boy.position.y)
        let distanceToMove = sqrt(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
        let moveDuration = distanceToMove / boySpeed
        let moveAction = SKAction.move(to: location, duration:(TimeInterval(moveDuration)))
        let doneAction = SKAction.run({ [weak self] in
            self?.boyMoveEnded()
        })
        let moveActionWithDone = SKAction.sequence([moveAction, doneAction])
        boy.run(moveActionWithDone, withKey:"boyMoving")
        
    }
    
    func end() {
        PlaygroundPage.current.assessmentStatus = .pass(message: "Very well! The things are more acessible now! [Conclusion](@next)")
    }
    
    func boyMoveEnded() {
        boy.removeAction(forKey: "boyMoving")
        end()
    }
}
