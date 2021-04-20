//
//  Page4Scene.swift
//  BookCore
//
//  Created by Nathalia Cardoso on 19/04/21.
//

import Foundation
import SpriteKit
import PlaygroundSupport

public class Page4Scene: SKScene {
    public override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(named: "background-color") ?? .gray
        
        let boy = SKSpriteNode(imageNamed: "boy")
        
        boy.position = CGPoint(x: 0, y: 0)
        addChild(boy)
        
        
    }
}
