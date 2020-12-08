//
//  MainMenu.swift
//  Infection Tag
//
//  Created by 64013840 on 11/9/20.


import SpriteKit

class MainMenu: SKScene {

    var gch: GameCenterHelper!
    var buttonPlay: MSButtonNode!
    var buttonPlaySolo: MSButtonNode!

    override func didMove(to view: SKView) {
//        buttonPlay = (self.childNode(withName: "buttonPlay") as! MSButtonNode)
//        buttonPlay.selectedHandler = {
//            self.loadGame()
//        }
        buttonPlaySolo = (self.childNode(withName: "buttonPlaySolo") as! MSButtonNode)
        buttonPlaySolo.selectedHandler = {
            self.loadGameSolo()
        }
//        buttonPlay.removeFromParent()


    }
    
    func loadGameSolo() {
        guard let skView = self.view else {
            print("Could not get Skview")
            return
        }
        let scene = GameSceneSolo(fileNamed: "GameSceneSolo")
        scene?.scaleMode = .resizeFill
        skView.showsPhysics = true
        skView.showsDrawCount = true
        skView.showsFPS=true

        /* 4) Start game scene */
        skView.presentScene(scene)
    }
    func disableButton() {
        buttonPlay.removeFromParent()
    }
    
    func enableButton(GCH: GameCenterHelper) {
        self.addChild(buttonPlay)
        self.gch = GCH
    }

    func loadGame() {
        self.gch.presentMatchmaker()
        
        
    }
}




