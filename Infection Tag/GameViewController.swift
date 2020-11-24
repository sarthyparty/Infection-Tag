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
    
    var scene=MainMenu(fileNamed: "GameScene")
    
    private var gameCenterHelper: GameCenterHelper!
    
    private var gameModel: GameModel! {
            didSet {
                updateUI()
            }
    }

    override func viewDidLoad() {
        
        gameCenterHelper = GameCenterHelper()
        gameCenterHelper.delegate = self
        gameCenterHelper.authenticatePlayer()
        let theScene = scene
        let skView = view as! SKView
        skView.presentScene(theScene)
    }
    
    func updateUI() {
        
    }
    

}

extension GameViewController: GameCenterHelperDelegate {
    func didChangeAuthStatus(isAuthenticated: Bool) {
        scene!.enableButton()
    }
    
    func presentGameCenterAuth(viewController: UIViewController?) {
        guard let vc = viewController else {return}
        self.present(vc, animated: true)
    }
    
    func presentMatchmaking(viewController: UIViewController?) {
        guard let vc = viewController else {return}
        self.present(vc, animated: true)
    }
    
    func presentGame(match: GKMatch) {
        performSegue(withIdentifier: "showGame", sender: match)
    }
}

