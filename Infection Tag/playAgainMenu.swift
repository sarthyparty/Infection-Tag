//
//  playAgainMenu.swift
//  Infection Tag
//
//  Created by 64002170 on 1/6/21.
//

import SpriteKit
import StoreKit
class playAgainMenu: SKScene {
    var buttonPlayS: MSButtonNode!

    override func didMove(to view: SKView) {
        if (uses%3==0){
            defaults.setValue(uses, forKey: "use")
            uses+=1
            SKStoreReviewController.requestReview()
        }
        self.backgroundColor=UIColor.green
        let PALabel1 = (self.childNode(withName: "paLabel1") as! SKLabelNode)
        let PALabel2 = (self.childNode(withName: "paLabel2") as! SKLabelNode)
        let PALabel3 = (self.childNode(withName: "paLabel3") as! SKLabelNode)
        let PAText1=NSMutableAttributedString(string:"You lost!")
        let PAText2=NSMutableAttributedString(string:"Your score was "+String(score-score%10)+".")
        let PAText3=NSMutableAttributedString(string:"High Score: "+String(defaults.integer(forKey: "highScore")))
        let attributesPA:[NSAttributedString.Key:Any] = [.strokeColor: UIColor.white, .strokeWidth: -3, .font: UIFont(name: "Futura", size: 70*scale1)!, .foregroundColor: UIColor.black]
        PAText1.addAttributes(attributesPA, range: NSMakeRange(0, PAText1.length))
        PAText2.addAttributes(attributesPA, range: NSMakeRange(0, PAText2.length))
        PAText3.addAttributes(attributesPA, range: NSMakeRange(0, PAText3.length))
        PALabel1.attributedText=PAText1
        PALabel2.attributedText=PAText2
        PALabel3.attributedText=PAText3
        PALabel3.position=CGPoint(x: screenWidth/2, y: screenHeight/2+75*scale1)
        PALabel2.position=CGPoint(x: screenWidth/2, y: screenHeight/2+145*scale1)
        PALabel1.position=CGPoint(x: screenWidth/2, y: screenHeight/2+215*scale1)
        buttonPlayS = (self.childNode(withName: "buttonPlaySolo") as! MSButtonNode)
        buttonPlayS.size=CGSize(width: 100*scale1, height: 75*scale1)
        buttonPlayS.position=CGPoint(x: screenWidth/2, y: screenHeight/2)
        buttonPlayS.selectedHandler = {
            self.loadGameSolo()
        }
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
}
