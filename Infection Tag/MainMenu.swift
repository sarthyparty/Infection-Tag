//
//  MainMenu.swift
//  Infection Tag
//
//  Created by 64013840 on 11/9/20.


//import SpriteKit
//
//class MainMenu: SKScene {
//
//
//var buttonPlay: MSButtonNode!
//
//    override func didMove(to view: SKView) {
//        buttonPlay = (self.childNode(withName: "buttonPlay") as! MSButtonNode)
//        buttonPlay.selectedHandler = {
//            self.loadGame()
//        }
//
//
//    }
//
//    func loadGame() {
//        /* 1) Grab reference to our SpriteKit view */
//        guard let skView = self.view as SKView? else {
//            print("Could not get Skview")
//            return
//        }
//
//        /* 2) Load Game scene */
//        guard let scene = GameScene(fileNamed:"GameScene") else {
//            print("Could not make GameScene, check the name is spelled correctly")
//            return
//        }
//
//        skView.showsPhysics = true
//        skView.showsDrawCount = true
//
//        /* 4) Start game scene */
//        skView.presentScene(scene)
//    }
//}
//

import UIKit
import GameKit

class MenuViewController: UIViewController {

    @IBOutlet weak var buttonMultiplayer: UIButton!
    
    private var gameCenterHelper: GameCenterHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonMultiplayer.isEnabled = false
        buttonMultiplayer.layer.cornerRadius = 10
        
        gameCenterHelper = GameCenterHelper()
        gameCenterHelper.delegate = self
        gameCenterHelper.authenticatePlayer()
    }

    @IBAction func buttonMultiplayerPressed() {
        gameCenterHelper.presentMatchmaker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? GameViewController,
              let match = sender as? GKMatch else { return }
        
        vc.match = match
    }
}

extension MenuViewController: GameCenterHelperDelegate {
    func didChangeAuthStatus(isAuthenticated: Bool) {
        buttonMultiplayer.isEnabled = isAuthenticated
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

