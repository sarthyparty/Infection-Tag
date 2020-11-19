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
    override func viewDidLoad() {
//        authenticateUser()
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
//    func authenticateUser() {
//      let player = GKLocalPlayer.local
//      player.authenticateHandler = { vc, error in
//        guard error == nil else {
//          print(error?.localizedDescription ?? "")
//          return
//        }
//        self.present(vc!, animated: true, completion: nil)
//      }
//    }
//    @IBAction func leaderboard(_ sender: Any) {
//      let vc = GKGameCenterViewController()
//      vc.gameCenterDelegate = self
//      vc.viewState = .leaderboards
//      vc.leaderboardIdentifier = "leaderboardID"
//      present(vc, animated: true, completion: nil)
//    }
//    @IBAction func achievements(_ sender: Any) {
//      let vc = GKGameCenterViewController()
//      vc.gameCenterDelegate = self
//      vc.viewState = .achievements
//      present(vc, animated: true, completion: nil)
//    }
//    }
//    extension GameViewController{
//    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
//      gameCenterViewController.dismiss(animated: true, completion: nil)
//    }
    }
