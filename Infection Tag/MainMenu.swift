//
//  MainMenu.swift
//  Infection Tag
//
//  Created by 64013840 on 11/9/20.


import SpriteKit

class MainMenu: SKScene {

    var gch: GameCenterHelper!
    var buttonPlay: MSButtonNode!

    override func didMove(to view: SKView) {
        buttonPlay = (self.childNode(withName: "buttonPlay") as! MSButtonNode)
        buttonPlay.selectedHandler = {
            self.loadGame()
        }
        buttonPlay.removeFromParent()


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




