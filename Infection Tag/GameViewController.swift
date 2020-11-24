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

class GameViewController: UIViewController {
    
    var match: GKMatch?
    
    private var gameCenterHelper: GameCenterHelper!
    
    private var gameModel: GameModel! {
            didSet {
                updateUI()
            }
    }

    override func viewDidLoad() {
        gameModel = GameModel()
        match?.delegate = self
        
        let scene = GameScene()
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

