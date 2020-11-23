//
//  GameViewController.swift
//  Infection Tag
//
//  Created by 64000774 on 10/14/20.
//

import UIKit
import SpriteKit
import GameplayKit
import GameKit
//import Amplify
//import AmplifyPlugins

class GameViewController: UIViewController/*, GKGameCenterControllerDelegate*/ {
    
    var match: GKMatch?
    
    private var gameModel: GameModel! {
            didSet {
                updateUI()
            }
    }

    override func viewDidLoad() {
        match?.delegate = self
        gameModel = GameModel()
        walkSprites.append(SKTexture(imageNamed: "walk1"))
        walkSprites.append(SKTexture(imageNamed: "walk2"))
        walkSprites.append(SKTexture(imageNamed: "walk3"))
        walkSprites.append(SKTexture(imageNamed: "walk4"))
        walkSprites.append(SKTexture(imageNamed: "walk5"))
        walkSprites.append(SKTexture(imageNamed: "walk6"))
        walkSprites.append(SKTexture(imageNamed: "walk7"))
        walkSprites.append(SKTexture(imageNamed: "walk8"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk1"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk2"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk3"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk4"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk5"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk6"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk7"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk8"))
        let scene = MainMenu(fileNamed: "GameScene")
//        scene.scaleMode = .aspectfill
        let skView = view as! SKView
        skView.presentScene(scene)
    }
    
    func updateUI() {
        
    }
    

}

extension GameViewController: GKMatchDelegate {
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        guard let model = GameModel.decode(data: data) else { return }
        gameModel = model
    }
}
