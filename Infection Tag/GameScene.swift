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
    var joystick = TLAnalogJoystick(withDiameter: 100)
    var character = Character(isInfected: false)
    var cam = SKCameraNode()
    var map=SKSpriteNode(imageNamed: "mapv1")
    var scaleChar=CGFloat(0.3)
    var ind=0
    
    
    
    
    override func didMove(to view: SKView) {
        let scaleMap=CGFloat(10*scaleChar)
        super.didMove(to: view)
        map.anchorPoint=CGPoint(x:0,y:0)
        map.position=CGPoint(x:0,y:0)
        joystick.position = CGPoint(x: screenWidth/6, y: screenHeight/6)
        character.position = CGPoint(x: screenWidth/2, y: screenHeight/2)
        character.size = CGSize(width:character.size.width*scaleChar, height:character.size.height*scaleChar)
        map.size = CGSize(width:map.size.width*scaleMap, height:map.size.height*scaleMap)
        joystick.alpha = 0.5
        self.camera = cam
        
        self.addChild(cam)
        //        joystick.name = "joystick"
        self.addChild(map)
        self.addChild(joystick)
        self.addChild(character)
        //Joystick movement handlers
        //        joystick.on(.move) { [unowned self] joystick in
        //            self.isTracking = true
        //        }
        //        joystick.on(.end) { [unowned self] joystick in
        //            self.isTracking = false
        //        }
    }
    override func sceneDidLoad() {
        //            //Importing sprites from GameScene.sks
        //            healthtext = camera?.childNode(withName: "health") as! SKLabelNode
        //            scorelabel = camera?.childNode(withName: "scorelabel") as! SKLabelNode
        //
        //            ship = Ship(texture: SKTexture(imageNamed: "playerShip1_blue.png"), isPlayer: true)
        //            ship.zPosition = 1
        //            camera?.addChild(ship.healthbar)
        //
        //            setButtonPositions()
        //            self.addChild(ship)
        //
        //            // Show fire effect on ship
        //            fireeffect1.position = CGPoint(x: -25, y: -45)
        //            fireeffect2.position = CGPoint(x: 25, y: -45)
        //            fireeffect1.zRotation = CGFloat.pi
        //            fireeffect2.zRotation = CGFloat.pi
        //            fireeffect1.alpha = 0.0
        //            fireeffect2.alpha = 0.0
        //            ship.addChild(fireeffect1)
        //            ship.addChild(fireeffect2)
        
        joystick.handleImage = UIImage(named: "shadedDark01.png")
        joystick.baseImage = UIImage(named: "shadedDark07.png")
        joystick.alpha = 0.5
        camera?.addChild(joystick)
        //Joystick movement handlers
        //            joystick.on(.move) { [unowned self] joystick in
        //                self.isTracking = true
        //            }
        //            joystick.on(.end) { [unowned self] joystick in
        //                self.isTracking = false
        //            }
        
        //            camera?.addChild(firebutton)
        //            firebutton.addChild(firelabel)
        
        //Creating rectangle level border
        let rect = CGRect(origin: CGPoint(x: -2500, y: -2500), size: CGSize(width: 5000, height: 5000))
        let borderindicator = SKShapeNode(rect: rect)
        borderindicator.lineWidth = 50
        borderindicator.alpha = 0.5
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        self.addChild(borderindicator)
//        for wall in self.walls {
//            self.addChild(wall)
//        }
//        
        //            physicsWorld.contactDelegate = self
        //
        //            // Initially spawn enemies
        //            for _ in 0 ..< 5 {
        //                spawnenemy()
        //            }
        //            //Enemy spawning
        //            let createenemies = SKAction.repeatForever(SKAction.sequence([SKAction.run {
        //                self.spawnenemy()
        //                } , SKAction.wait(forDuration: 4.0)]))
        //            self.run(createenemies)
        //            //health pack spawning
        //            let createpowerups = SKAction.repeatForever(SKAction.sequence([SKAction.run {
        //                self.spawnhealthkit()
        //                } , SKAction.wait(forDuration: 10.0)]))
        //            self.run(createpowerups)
        //
        
        
    }
    override func update(_ currentTime: TimeInterval) {
        var boundaryx=false
        var boundaryy=false
        if (self.character.position.x + (self.joystick.velocity.x)<character.size.width/2){
            self.character.position.x=character.size.width/2
            boundaryx=true
        }
        if (self.character.position.y + (self.joystick.velocity.y)<character.size.height/2){
            self.character.position.y=character.size.height/2
            boundaryy=true
        }
        if (self.character.position.x + (self.joystick.velocity.x)>map.size.width-character.size.width/2){
            self.character.position.x=map.size.width-character.size.width/2
            boundaryx=true
        }
        if (self.character.position.y + (self.joystick.velocity.y)>map.size.height-character.size.height/2){
            self.character.position.y=map.size.height-character.size.height/2
            boundaryy=true
        }
        if(boundaryx||boundaryy){
            if (boundaryx&&boundaryy){
                self.character.position = CGPoint(x: self.character.position.x, y: self.character.position.y)
            }
            else if boundaryx{
                self.character.position = CGPoint(x: self.character.position.x, y: self.character.position.y+(self.joystick.velocity.y))
            }
            else if boundaryy{
                self.character.position = CGPoint(x: self.character.position.x + (self.joystick.velocity.x), y: self.character.position.y)
            }
        } else {
            self.character.position = CGPoint(x: self.character.position.x + (self.joystick.velocity.x), y: self.character.position.y + (self.joystick.velocity.y))
        }
        character.zRotation=joystick.angular
        camera?.position = character.position
        joystick.position = CGPoint(x:camera!.position.x-(2*screenWidth)/6, y: camera!.position.y-(2*screenHeight)/6)
        if(joystick.velocity == CGPoint(x: 0,y: 0)){
            ind=8
            character.texture = arraySprites[(ind-(ind%4))/4]
        } else {
            if ind>31{
                ind=0
            }
            character.texture = arraySprites[(ind-(ind%4))/4]
            ind+=1
        }
    }
}
