
  MainMenu.swift
  Infection Tag

  Created by 64013840 on 11/9/20.


import SpriteKit

class MainMenu: SKScene {


var buttonPlay: MSButtonNode!

    override func didMove(to view: SKView) {
        buttonPlay.selectedHandler = self.loadGame()
        buttonPlay = self.childNode(withName: "buttonPlay") as! MSButtonNode
        

    }
    
    func loadGame() {
        /* 1) Grab reference to our SpriteKit view */
        guard let skView = self.view as SKView! else {
            print("Could not get Skview")
            return
        }

        /* 2) Load Game scene */
        guard let scene = GameScene(fileNamed:"GameScene") else {
            print("Could not make GameScene, check the name is spelled correctly")
            return
        }

        /* 3) Ensure correct aspect mode */
        scene.scaleMode = .aspectFill

        /* Show debug */
        skView.showsPhysics = true
        skView.showsDrawCount = true
        skView.showsFPS = true

        /* 4) Start game scene */
        skView.presentScene(scene)
    }
}

