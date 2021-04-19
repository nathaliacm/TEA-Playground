//
//  GameScene.swift
//  BookCore
//
//  Created by Nathalia Cardoso on 14/04/21.
//

import SpriteKit
import UIKit
import PlaygroundSupport

public class Page1Scene: SKScene {
    public var w:CGFloat = 0
    public var h:CGFloat = 0
    public let puzzle1 = SKSpriteNode(imageNamed: "puzzle1")
    public let puzzle2 = SKSpriteNode(imageNamed: "puzzle2")
    public let puzzle3 = SKSpriteNode(imageNamed: "puzzle3")
    public let puzzle4 = SKSpriteNode(imageNamed: "puzzle4")
    public let puzzle5 = SKSpriteNode(imageNamed: "puzzle5")
    public let puzzle6 = SKSpriteNode(imageNamed: "puzzle6")
    public let puzzle7 = SKSpriteNode(imageNamed: "puzzle7")
    
    public let puzzle1_light = SKSpriteNode(imageNamed: "puzzle1-light")
    public let puzzle2_light = SKSpriteNode(imageNamed: "puzzle2-light")
    public let puzzle3_light = SKSpriteNode(imageNamed: "puzzle3-light")
    public let puzzle4_light = SKSpriteNode(imageNamed: "puzzle4-light")
    public let puzzle5_light = SKSpriteNode(imageNamed: "puzzle5-light")
    public let puzzle6_light = SKSpriteNode(imageNamed: "puzzle6-light")
    public let puzzle7_light = SKSpriteNode(imageNamed: "puzzle7-light")
    
    public var isBeingUsed = "none"
    public var initialPositionPuzzle1 = CGPoint()
    public var initialPositionPuzzle2 = CGPoint()
    public var initialPositionPuzzle3 = CGPoint()
    public var initialPositionPuzzle4 = CGPoint()
    public var initialPositionPuzzle5 = CGPoint()
    public var initialPositionPuzzle6 = CGPoint()
    public var initialPositionPuzzle7 = CGPoint()
    
    public var puzzle1Status = false
    public var puzzle2Status = false
    public var puzzle3Status = false
    public var puzzle4Status = false
    public var puzzle5Status = false
    public var puzzle6Status = false
    public var puzzle7Status = false
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(named: "background-color") ?? .gray
        self.setupLaco()
        self.setupPuzzlesMark()
        
        self.setupPuzzle1_light()
        self.setupPuzzle2_light()
        self.setupPuzzle3_light()
        self.setupPuzzle4_light()
        self.setupPuzzle5_light()
        self.setupPuzzle6_light()
        self.setupPuzzle7_light()
        
        self.setupPuzzle1()
        self.setupPuzzle2()
        self.setupPuzzle3()
        self.setupPuzzle4()
        self.setupPuzzle5()
        self.setupPuzzle6()
        self.setupPuzzle7()
        
    }
    
    public func setupLaco() {
        let lacoNode = SKSpriteNode(imageNamed: "laco-completo")
        w = 0.34517333
        h = 0.36601199
        lacoNode.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        lacoNode.position = CGPoint(x: 0, y: self.frame.height*0.23323088)
        addChild(lacoNode)
        
    }
    
    public func setupPuzzle1_light() {
        w = 0.15308
        h = 0.1378036
        puzzle1_light.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle1_light.position = CGPoint(x: -(self.frame.width/2)*0.19057532, y: self.frame.height*0.123)
        puzzle1_light.name = "puzzle1_light"
        //puzzle1_light.zPosition = 11
        addChild(puzzle1_light)
        puzzle1_light.isHidden = true
        
    }
    public func setupPuzzle2_light() {
        w = 0.17486667
        h = 0.13921289
        puzzle2_light.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle2_light.position = CGPoint(x: (self.frame.width)*0.001, y: self.frame.height*0.213)
        puzzle2_light.name = "puzzle2_light"
        addChild(puzzle2_light)
        puzzle2_light.isHidden = true
    }
    
    public func setupPuzzle3_light() {
        w = 0.12002667
        h = 0.13921289
        puzzle3_light.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle3_light.position = CGPoint(x: (self.frame.width)*0.06533333, y: self.frame.height*0.316)
        puzzle3_light.name = "puzzle3_light"
        addChild(puzzle3_light)
        puzzle3_light.isHidden = true
        
    }
    
    public func setupPuzzle4_light() {
        w = 0.21158667
        h = 0.06730885
        puzzle4_light.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle4_light.position = CGPoint(x: -(self.frame.width)*0.015, y: self.frame.height*0.383)
        puzzle4_light.name = "puzzle4_light"
        addChild(puzzle4_light)
        puzzle4_light.isHidden = true
        
    }
    public func setupPuzzle5_light() {
        w = 0.13088
        h = 0.13831334
        puzzle5_light.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle5_light.position = CGPoint(x: -(self.frame.width)*0.067, y: self.frame.height*0.2835)
        puzzle5_light.name = "puzzle5_light"
        addChild(puzzle5_light)
        puzzle5_light.isHidden = true
        
    }
    public func setupPuzzle6_light() {
        w = 0.10928
        h = 0.09674663
        puzzle6_light.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle6_light.position = CGPoint(x: (self.frame.width)*0.049, y: self.frame.height*0.167)
        puzzle6_light.name = "puzzle6_light"
        addChild(puzzle6_light)
        puzzle6_light.isHidden = true
        
    }
    public func setupPuzzle7_light() {
        w = 0.13496
        h = 0.11744378
        puzzle7_light.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle7_light.position = CGPoint(x: (self.frame.width)*0.1033, y: self.frame.height*0.1133)
        puzzle7_light.name = "puzzle7_light"
        addChild(puzzle7_light)
        puzzle7_light.isHidden = true
        
    }
    
    public func setupPuzzlesMark() {
        let puzzleNode = SKSpriteNode(imageNamed: "puzzlesMark")
        w = 0.895
        h = 0.31586207
        puzzleNode.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzleNode.position = CGPoint(x: 0, y: -self.frame.height*0.16041979)
        addChild(puzzleNode)
    }
    
    public func setupPuzzle1() {
        w = 0.15308
        h = 0.1378036
        self.initialPositionPuzzle1 = CGPoint(x: -(self.frame.width)*0.368, y: -self.frame.height*0.074)
        puzzle1.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle1.position = self.initialPositionPuzzle1
        puzzle1.name = "puzzle1"
        addChild(puzzle1)
    }
    
    public func setupPuzzle2() {
        w = 0.17486667
        h = 0.13921289
        self.initialPositionPuzzle2 = CGPoint(x: -(self.frame.width)*0.128, y: -self.frame.height*0.074)
        puzzle2.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle2.position = self.initialPositionPuzzle2
        puzzle2.name = "puzzle2"
        addChild(puzzle2)
    }
    
    public func setupPuzzle3() {
        w = 0.12002667
        h = 0.13921289
        self.initialPositionPuzzle3 = CGPoint(x: (self.frame.width)*0.09733333, y: -self.frame.height*0.0767)
        puzzle3.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle3.position =  self.initialPositionPuzzle3
        puzzle3.name = "puzzle3"
        addChild(puzzle3)
    }
    
    public func setupPuzzle4() {
        w = 0.21158667
        h = 0.06730885
        self.initialPositionPuzzle4 = CGPoint(x: (self.frame.width)*0.34, y: -self.frame.height*0.073)
        puzzle4.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle4.position = self.initialPositionPuzzle4
        puzzle4.name = "puzzle4"
        addChild(puzzle4)
    }
    
    public func setupPuzzle5() {
        w = 0.13088
        h = 0.13831334
        self.initialPositionPuzzle5 = CGPoint(x: -(self.frame.width)*0.26666667, y: -self.frame.height*0.2455)
        puzzle5.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle5.position = self.initialPositionPuzzle5
        puzzle5.name = "puzzle5"
        addChild(puzzle5)
    }
    
    public func setupPuzzle6() {
        w = 0.10928
        h = 0.09674663
        self.initialPositionPuzzle6 = CGPoint(x: 0, y: -self.frame.height*0.2455)
        puzzle6.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle6.position = self.initialPositionPuzzle6
        puzzle6.name = "puzzle6"
        addChild(puzzle6)
    }

    public func setupPuzzle7() {
        w = 0.13496
        h = 0.11744378
        self.initialPositionPuzzle7 = CGPoint(x: (self.frame.width)*0.268, y: -self.frame.height*0.235)
        puzzle7.size = CGSize(width: self.frame.width*w, height: self.frame.height*h)
        puzzle7.position = self.initialPositionPuzzle7
        puzzle7.name = "puzzle7"
        addChild(puzzle7)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            if (self.atPoint(location).name == "puzzle1") && isBeingUsed == "none" {
                self.puzzle1.xScale = 1.05
                self.puzzle1.yScale = 1.05
                self.puzzle1.zPosition = 10
                self.isBeingUsed = "puzzle1"
            }
            if (self.atPoint(location).name == "puzzle2") && isBeingUsed == "none" {
                self.puzzle2.xScale = 1.05
                self.puzzle2.yScale = 1.05
                self.puzzle2.zPosition = 10
                self.isBeingUsed = "puzzle2"
            }
            if (self.atPoint(location).name == "puzzle3") && isBeingUsed == "none" {
                self.puzzle3.xScale = 1.05
                self.puzzle3.yScale = 1.05
                self.puzzle3.zPosition = 10
                self.isBeingUsed = "puzzle3"
            }
            if (self.atPoint(location).name == "puzzle4") && isBeingUsed == "none" {
                self.puzzle4.xScale = 1.05
                self.puzzle4.yScale = 1.05
                self.puzzle4.zPosition = 10
                self.isBeingUsed = "puzzle4"
            }
            if (self.atPoint(location).name == "puzzle5") && isBeingUsed == "none" {
                self.puzzle5.xScale = 1.05
                self.puzzle5.yScale = 1.05
                self.puzzle5.zPosition = 10
                self.isBeingUsed = "puzzle5"
            }
            if (self.atPoint(location).name == "puzzle6") && isBeingUsed == "none" {
                self.puzzle6.xScale = 1.05
                self.puzzle6.yScale = 1.05
                self.puzzle6.zPosition = 10
                self.isBeingUsed = "puzzle6"
            }
            if (self.atPoint(location).name == "puzzle7") && isBeingUsed == "none" {
                self.puzzle7.xScale = 1.05
                self.puzzle7.yScale = 1.05
                self.puzzle7.zPosition = 10
                self.isBeingUsed = "puzzle7"
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            if (self.atPoint(location).name == "puzzle1") && isBeingUsed == "puzzle1" {
                self.puzzle1.position = location
                if (self.atPoint(location).contains(puzzle1_light.position)) {
                    self.puzzle1_light.isHidden = false
                }
            }
            if (self.atPoint(location).name == "puzzle2") && isBeingUsed == "puzzle2" {
                self.puzzle2.position = location
                if (self.atPoint(location).contains(puzzle2_light.position)) {
                    self.puzzle2_light.isHidden = false
                }
            }
            if (self.atPoint(location).name == "puzzle3") && isBeingUsed == "puzzle3" {
                self.puzzle3.position = location
                if (self.atPoint(location).contains(puzzle3_light.position)) {
                    self.puzzle3_light.isHidden = false
                }
            }
            if (self.atPoint(location).name == "puzzle4") && isBeingUsed == "puzzle4" {
                self.puzzle4.position = location
                if (self.atPoint(location).contains(puzzle4_light.position)) {
                    self.puzzle4_light.isHidden = false
                }
            }
            if (self.atPoint(location).name == "puzzle5") && isBeingUsed == "puzzle5" {
                self.puzzle5.position = location
                if (self.atPoint(location).contains(puzzle5_light.position)) {
                    self.puzzle5_light.isHidden = false
                }
            }
            if (self.atPoint(location).name == "puzzle6") && isBeingUsed == "puzzle6" {
                self.puzzle6.position = location
                if (self.atPoint(location).contains(puzzle6_light.position)) {
                    self.puzzle6_light.isHidden = false
                }
            }
            if (self.atPoint(location).name == "puzzle7") && isBeingUsed == "puzzle7" {
                self.puzzle7.position = location
                if (self.atPoint(location).contains(puzzle7_light.position)) {
                    self.puzzle7_light.isHidden = false
                }
            }
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            if (self.atPoint(location).name == "puzzle1") {
                self.puzzle1.xScale = 1
                self.puzzle1.yScale = 1
                self.puzzle1.zPosition = 1
                if (self.atPoint(location).contains(puzzle1_light.position)) {
                    self.puzzle1.position = puzzle1_light.position
                    puzzle1Status = true
                } else {
                    self.puzzle1.position = self.initialPositionPuzzle1
                    puzzle1Status = false
                }
            }
            if (self.atPoint(location).name == "puzzle2") {
                self.puzzle2.xScale = 1
                self.puzzle2.yScale = 1
                self.puzzle2.zPosition = 1
                if (self.atPoint(location).contains(puzzle2_light.position)) {
                    self.puzzle2.position = puzzle2_light.position
                    puzzle2Status = true
                } else {
                    self.puzzle2.position = self.initialPositionPuzzle2
                    puzzle2Status = false
                }
            }
            if (self.atPoint(location).name == "puzzle3") {
                self.puzzle3.xScale = 1
                self.puzzle3.yScale = 1
                self.puzzle3.zPosition = 1
                if (self.atPoint(location).contains(puzzle3_light.position)) {
                    self.puzzle3.position = puzzle3_light.position
                    puzzle3Status = true
                } else {
                    self.puzzle3.position = self.initialPositionPuzzle3
                    puzzle3Status = false
                }
            }
            if (self.atPoint(location).name == "puzzle4") {
                self.puzzle4.xScale = 1
                self.puzzle4.yScale = 1
                self.puzzle4.zPosition = 1
                if (self.atPoint(location).contains(puzzle4_light.position)) {
                    self.puzzle4.position = puzzle4_light.position
                    puzzle4Status = true
                } else {
                    self.puzzle4.position = self.initialPositionPuzzle4
                    puzzle4Status = false
                }
            }
            if (self.atPoint(location).name == "puzzle5") {
                self.puzzle5.xScale = 1
                self.puzzle5.yScale = 1
                self.puzzle5.zPosition = 1
                if (self.atPoint(location).contains(puzzle5_light.position)) {
                    self.puzzle5.position = puzzle5_light.position
                    puzzle5Status = true
                } else {
                    self.puzzle5.position = self.initialPositionPuzzle5
                    puzzle5Status = false
                }
            }
            if (self.atPoint(location).name == "puzzle6") {
                self.puzzle6.xScale = 1
                self.puzzle6.yScale = 1
                self.puzzle6.zPosition = 1
                if (self.atPoint(location).contains(puzzle6_light.position)) {
                    self.puzzle6.position = puzzle6_light.position
                    puzzle6Status = true
                } else {
                    self.puzzle6.position = self.initialPositionPuzzle6
                    puzzle6Status = false
                }
            }
            if (self.atPoint(location).name == "puzzle7") {
                self.puzzle7.xScale = 1
                self.puzzle7.yScale = 1
                self.puzzle7.zPosition = 1
                if (self.atPoint(location).contains(puzzle7_light.position)) {
                    self.puzzle7.position = puzzle7_light.position
                    puzzle7Status = true
                } else {
                    self.puzzle7.position = self.initialPositionPuzzle7
                    puzzle7Status = false
                }
            }
        }
        self.isBeingUsed = "none"
        self.puzzle1_light.isHidden = true
        self.puzzle2_light.isHidden = true
        self.puzzle3_light.isHidden = true
        self.puzzle4_light.isHidden = true
        self.puzzle5_light.isHidden = true
        self.puzzle6_light.isHidden = true
        self.puzzle7_light.isHidden = true
        self.checkIfIsFinished()
    }
    
    public func checkIfIsFinished() {
        if (puzzle1Status || puzzle2Status || puzzle3Status || puzzle4Status || puzzle5Status || puzzle6Status || puzzle7Status) {
            let backPopup = SKSpriteNode(imageNamed: "backPopup")
            backPopup.size = CGSize(width: self.frame.width, height: self.frame.height)
            backPopup.position = CGPoint(x: 0, y: 0)
            backPopup.zPosition = 20
            addChild(backPopup)
            self.isUserInteractionEnabled = false
            
            PlaygroundPage.current.assessmentStatus = .pass(message: "Let's see the next page! [Go to next page](@next)")
        }
    }
}
