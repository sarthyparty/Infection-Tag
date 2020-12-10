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
    var normalGuy: SKSpriteNode!
    var z1: SKSpriteNode!
    var z2: SKSpriteNode!

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
        nameDisplay.position=CGPoint(x: screenWidth/2, y: 3*screenHeight/4)
        nameDisplay.yScale=scale*2
        nameDisplay.xScale=scale*2
        normalGuy = (self.childNode(withName: "normalGuy") as! SKSpriteNode)
        normalGuy.position=CGPoint(x: normalGuy.position.x*scale, y: normalGuy.position.y*scale)
        normalGuy.size=CGSize(width: normalGuy.size.width*scale, height: normalGuy.size.height*scale)
        z1 = (self.childNode(withName: "z1") as! SKSpriteNode)
        z1.position=CGPoint(x: z1.position.x*scale, y: z1.position.y*scale)
        z1.size=CGSize(width: z1.size.width*scale, height: z1.size.height*scale)
        z2 = (self.childNode(withName: "z2") as! SKSpriteNode)
        z2.position=CGPoint(x: z2.position.x*scale, y: z2.position.y*scale)
        z2.size=CGSize(width: z2.size.width*scale, height: z2.size.height*scale)

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




