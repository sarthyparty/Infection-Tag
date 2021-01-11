//
//  MainMenu.swift
//  Infection Tag
//
//  Created by 64013840 on 11/9/20.


import SpriteKit

let defaults = UserDefaults.standard
var uses=defaults.integer(forKey: "use")

class MainMenu: SKScene {

    var gch: GameCenterHelper!
    var buttonPlay: MSButtonNode!
    var buttonPlaySolo: MSButtonNode!
    var nameDisplay: SKNode!
    var normalGuy: SKSpriteNode!
    var z1: SKSpriteNode!
    var z2: SKSpriteNode!
    

    override func didMove(to view: SKView) {
        print(uses)
        uses+=1
        defaults.setValue(uses, forKey: "use")
        buttonPlay = (self.childNode(withName: "buttonPlay") as! MSButtonNode)
        buttonPlay.selectedHandler = {
            self.loadGame()
        }
        buttonPlay.removeFromParent()
        buttonPlaySolo = (self.childNode(withName: "buttonPlaySolo") as! MSButtonNode)
        buttonPlaySolo.position=CGPoint(x: screenWidth/2, y: screenHeight/2)
        buttonPlaySolo.selectedHandler = {
            self.loadGameSolo()
        }
        nameDisplay = (self.childNode(withName: "name") as! SKSpriteNode)
        nameDisplay.position=CGPoint(x: screenWidth/2, y: 3*screenHeight/4)
        nameDisplay.yScale=scale1*2
        nameDisplay.xScale=scale1*2
        normalGuy = (self.childNode(withName: "normalGuy") as! SKSpriteNode)
        normalGuy.position=CGPoint(x: normalGuy.position.x*scale1, y: normalGuy.position.y*scale1)
        normalGuy.size=CGSize(width: normalGuy.size.width*scale1, height: normalGuy.size.height*scale1)
        z1 = (self.childNode(withName: "z1") as! SKSpriteNode)
        z1.position=CGPoint(x: z1.position.x*scale1, y: z1.position.y*scale1)
        z1.size=CGSize(width: z1.size.width*scale1, height: z1.size.height*scale1)
        z2 = (self.childNode(withName: "z2") as! SKSpriteNode)
        z2.position=CGPoint(x: z2.position.x*scale1, y: z2.position.y*scale1)
        z2.size=CGSize(width: z2.size.width*scale1, height: z2.size.height*scale1)
        


    }
    
    func loadGameSolo() {
        guard let skView = self.view else {
            print("Could not get Skview")
            return
        }
        let scene = GameSceneSolo(fileNamed: "GameSceneSolo")
        scene?.scaleMode = .resizeFill
//        skView.showsPhysics = true
//        skView.showsDrawCount = true
//        skView.showsFPS=true

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




