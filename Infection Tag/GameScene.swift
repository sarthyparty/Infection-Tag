//
//  GameScene.swift
//  Infection Tag
//
//  Created by 64000774 on 10/14/20.
//
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var joystick = TLAnalogJoystick(withDiameter: 100)
    
    override func didMove(to view: SKView) {
        joystick.position = CGPoint(x: 100, y: 100)
        joystick.handleImage = UIImage(named: "test_joystick.png")
        joystick.baseImage = UIImage(named: "test_joystick.png")
        joystick.alpha = 0.5
        camera?.addChild(joystick)
        //Joystick movement handlers
//        joystick.on(.move) { [unowned self] joystick in
//            self.isTracking = true
//        }
//        joystick.on(.end) { [unowned self] joystick in
//            self.isTracking = false
//        }
    }
    
}
