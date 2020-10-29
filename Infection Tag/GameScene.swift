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

struct PhysicsCategory {
  static let none      : UInt32 = 0
  static let all       : UInt32 = UInt32.max
  static let character   : UInt32 = 0b1       // 1
  static let wall: UInt32 = 0b10      // 2
}

class GameScene: SKScene {
    var joystick = TLAnalogJoystick(withDiameter: 100)
    var character = Character(isInfected: false)
    var cam = SKCameraNode()
    var map=SKSpriteNode(imageNamed: "mapv2")
    var scaleChar=CGFloat(0.3)
    var ind=0
    var boundaryx=false
    var boundaryy=false
    var testWall=Wall(imageName: "test", siz: CGSize(width:100, height:200), Position: CGPoint(x:1000,y:1000))
    var prevX=screenWidth/2
    var prevY=screenHeight/2
    
    
    
    override func didMove(to view: SKView) {
        let scaleMap=CGFloat(10*scaleChar)
        super.didMove(to: view)
        map.anchorPoint=CGPoint(x:0,y:0)
        map.position=CGPoint(x:0,y:0)
        joystick.position = CGPoint(x: screenWidth/6, y: screenHeight/6)
        character.position = CGPoint(x: screenWidth/2, y: screenHeight/2)
        character.size = CGSize(width:180*scaleChar, height:180*scaleChar)
        map.size = CGSize(width:map.size.width*scaleMap, height:map.size.height*scaleMap)
        joystick.alpha = 0.5
        self.camera = cam
        self.addChild(cam)
        //        joystick.name = "joystick"
        self.addChild(map)
        self.addChild(joystick)
        self.addChild(character)
        self.addChild(testWall)
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
    }
    override func sceneDidLoad() {
        joystick.handleImage = UIImage(named: "shadedDark01.png")
        joystick.baseImage = UIImage(named: "shadedDark07.png")
        joystick.alpha = 0.5
        camera?.addChild(joystick)
        
        //Creating rectangle level border
        let rect = CGRect(origin: CGPoint(x: -2500, y: -2500), size: CGSize(width: 5000, height: 5000))
        let borderindicator = SKShapeNode(rect: rect)
        borderindicator.lineWidth = 50
        borderindicator.alpha = 0.5
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        self.addChild(borderindicator)
        character.physicsBody = SKPhysicsBody(circleOfRadius: 180/4, center: character.position) // 1
        character.physicsBody?.isDynamic = true // 2
        character.physicsBody?.categoryBitMask = PhysicsCategory.character // 3
        character.physicsBody?.contactTestBitMask = PhysicsCategory.wall // 4
        character.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
        testWall.physicsBody = SKPhysicsBody(rectangleOf:testWall.size) // 1
        testWall.physicsBody?.isDynamic = true // 2
        testWall.physicsBody?.categoryBitMask =  PhysicsCategory.wall// 3
        testWall.physicsBody?.contactTestBitMask = PhysicsCategory.character // 4
        testWall.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
        
        
    }
    
    func characterHitWall(wall: SKSpriteNode, character: SKSpriteNode) {
//        if (self.character.position.x + (self.joystick.velocity.x)<wall.size.width+wall.position.x+character.size.width/2){
//            self.character.position.x=character.size.width/2
//            boundaryx=true
//        }
//        if (self.character.position.y + (self.joystick.velocity.y)<wall.position.y + character.size.height/2){
//            self.character.position.y=character.size.height/2
//            boundaryy=true
//        }
//        if (self.character.position.x + (self.joystick.velocity.x)>wall.position.x-character.size.width/2){
//            self.character.position.x=wall.position.x-character.size.width/2
//            boundaryx=true
//        }
//        if (self.character.position.y + (self.joystick.velocity.y)>wall.position.y-wall.size.height-character.size.height/2){
//            self.character.position.y=prevY
//            boundaryy=true
//        }
        boundaryy=true
        
        character.position = CGPoint(x: 500, y: 500)
//        character.size=(CGSize(width: 100, height: 100))
    }
    
    override func update(_ currentTime: TimeInterval) {
        if(boundaryx==false){
        if (self.character.position.x + (self.joystick.velocity.x)<character.size.width/2){
            self.character.position.x=character.size.width/2
            boundaryx=true
        } else if (self.character.position.x + (self.joystick.velocity.x)>map.size.width-character.size.width/2){
            self.character.position.x=map.size.width-character.size.width/2
            boundaryx=true
        } else {
            boundaryx=false
        }
        }
        if(boundaryy==false){
        if (self.character.position.y + (self.joystick.velocity.y)<character.size.height/2){
            self.character.position.y=character.size.height/2
            boundaryy=true
        } else if (self.character.position.y + (self.joystick.velocity.y)>map.size.height-character.size.height/2){
            self.character.position.y=map.size.height-character.size.height/2
            boundaryy=true
        } else {
            boundaryy=false
        }
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
            character.zRotation=joystick.angular
        }
        prevX=character.position.x
        prevY=character.position.y
    }
    
    
}
extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
      // 1
      var firstBody: SKPhysicsBody
      var secondBody: SKPhysicsBody
      if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
        firstBody = contact.bodyA
        secondBody = contact.bodyB
      } else {
        firstBody = contact.bodyB
        secondBody = contact.bodyA
      }
     
      // 2
      if ((firstBody.categoryBitMask & PhysicsCategory.character != 0) &&
          (secondBody.categoryBitMask & PhysicsCategory.wall != 0)) {
        if let character = firstBody.node as? SKSpriteNode,
          let wall = secondBody.node as? SKSpriteNode {
          characterHitWall(wall: wall, character: character)
        }
      }
    }
}
