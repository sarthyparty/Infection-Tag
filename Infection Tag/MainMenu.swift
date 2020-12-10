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
    var nameDisplay: SKNode!
    var background: SKSpriteNode!

    override func didMove(to view: SKView) {
//        buttonPlay = (self.childNode(withName: "buttonPlay") as! MSButtonNode)
//        buttonPlay.selectedHandler = {
//            self.loadGame()
//        }

        buttonPlaySolo = (self.childNode(withName: "buttonPlaySolo") as! MSButtonNode)
        buttonPlaySolo.position=CGPoint(x: screenWidth/2, y: screenHeight/2)
        buttonPlaySolo.selectedHandler = {
            self.loadGameSolo()
        }
        nameDisplay = (self.childNode(withName: "name") as! SKSpriteNode)
        nameDisplay.position=CGPoint(x: screenWidth/2, y: 2*screenHeight/3)
        nameDisplay.yScale=scale*2
        nameDisplay.xScale=scale*2
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




