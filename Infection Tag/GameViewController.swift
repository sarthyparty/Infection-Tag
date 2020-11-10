//
//  GameViewController.swift
//  Infection Tag
//
//  Created by 64000774 on 10/14/20.
//

import UIKit
import SpriteKit
import GameplayKit
import Amplify
import AmplifyPlugins

class GameViewController: UIViewController {
    override func viewDidLoad() {
        arraySprites.append(SKTexture(imageNamed: "walk1"))
        arraySprites.append(SKTexture(imageNamed: "walk2"))
        arraySprites.append(SKTexture(imageNamed: "walk3"))
        arraySprites.append(SKTexture(imageNamed: "walk4"))
        arraySprites.append(SKTexture(imageNamed: "walk5"))
        arraySprites.append(SKTexture(imageNamed: "walk6"))
        arraySprites.append(SKTexture(imageNamed: "walk7"))
        arraySprites.append(SKTexture(imageNamed: "walk8"))
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
    }
    
}
