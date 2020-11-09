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
        print("Hey")
        configureAmplify()
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
    }
    
    func configureAmplify() {
       let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
       do {
           try Amplify.add(plugin: dataStorePlugin)
           try Amplify.configure()
           print("Initialized Amplify");
       } catch {
           // simplified error handling for the tutorial
           print("Could not initialize Amplify: \(error)")
       }
    }
}
