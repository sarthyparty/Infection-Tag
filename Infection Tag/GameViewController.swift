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

