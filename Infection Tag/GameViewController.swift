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
        GKLocalPlayer.local.authenticateHandler = { viewController, error in
            if viewController != nil {
                // Present the view controller so the player can sign in
                return
            }
            if error != nil {
                // Player could not be authenticated
                // Disable Game Center in the game
                return
            }
            
            // Player was successfully authenticated
            // Check if there are any player restrictions before starting the game
                    
            if GKLocalPlayer.local.isUnderage {
                // Hide explicit game content
            }

            if GKLocalPlayer.local.isMultiplayerGamingRestricted {
                // Disable multiplayer game features
            }

            
            // Perform any other configurations as needed (for example, access point)
        }
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

    }
