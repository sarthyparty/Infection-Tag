//
//  MainMenu.swift
//  Infection Tag
//
//  Created by 64013840 on 11/9/20.


import SpriteKit

class MainMenu: SKScene {


var buttonPlay: MSButtonNode!

    override func didMove(to view: SKView) {
        buttonPlay = (self.childNode(withName: "buttonPlay") as! MSButtonNode)
        buttonPlay.selectedHandler = {
            self.loadGame()
        }
        

    }
    
    func loadGame() {
        /* 1) Grab reference to our SpriteKit view */
        guard let skView = self.view as SKView? else {
            print("Could not get Skview")
            return
        }

        /* 2) Load Game scene */
        guard let scene = GameScene(fileNamed:"GameScene") else {
            print("Could not make GameScene, check the name is spelled correctly")
            return
        }

        /* 4) Start game scene */
        skView.presentScene(scene)
    }
}

