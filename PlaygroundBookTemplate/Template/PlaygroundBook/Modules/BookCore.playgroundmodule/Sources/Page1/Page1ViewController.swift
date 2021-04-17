//
//  GameViewController.swift
//  BookCore
//
//  Created by Nathalia Cardoso on 14/04/21.
//

import SpriteKit
import UIKit

public class Page1ViewController: UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        let view = SKView()
        let scene = Page1Scene(fileNamed: "GameScene")
      //  scene?.size = CGSize(width: 750, height: 1334)
        scene?.scaleMode = .aspectFit
        view.presentScene(scene)
        self.view = view
    }
}
