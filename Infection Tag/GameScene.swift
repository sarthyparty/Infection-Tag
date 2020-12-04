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
import GameKit

var myID = ""

struct PhysicsCategory {
  static let none      : UInt32 = 0
  static let all       : UInt32 = UInt32.max
  static let character   : UInt32 = 0b1       // 1
  static let wall: UInt32 = 0b10      // 2
}

class GameScene: SKScene {
    var joystick = TLAnalogJoystick(withDiameter: 100)
    var character = Character(isInfected: false, ID: "Player")
    var cam = SKCameraNode()
    var map=SKSpriteNode(imageNamed: "mapFINAL")
    var back=SKSpriteNode(imageNamed: "black")
    var dimDash=SKSpriteNode(imageNamed:"dash")
    var testInfected = Character(isInfected: true, ID: "Player")
    var otherCharacter: Character = Character(isInfected: false, ID: "HELLO")
    var scaleChar=CGFloat(0.3)
    var ind=0
    var boundaryx=false
    var boundaryy=false
    var hitwallleft = false
    var hitwallright = false
    var hitwalltop = false
    var hitwallbottom = false
    var hitcornerbl = false
    var xmovement = true
    var ymovement = true
    var testWall:Wall?
    var arrayWall:[Wall] = [Wall]()
    var dashButton : UIButton=UIButton(type: UIButton.ButtonType.custom)
    var speedScale=CGFloat(1)
    var counter=0
    var timerActionButton=0
    var startTimer=false
    var startCounter=false
    var match: GKMatch?
    private var gameModel: GameModel!
    @objc func dash() {
        speedScale=CGFloat(3)
        startCounter=true
        startTimer=true
        dashButton.removeFromSuperview()
        dimDash.isHidden=false
    }
    
    func updateUI() {
        if gameModel.players.count != 2 {
            savePlayers()
        }
        otherCharacter.position.x = CGFloat(gameModel.players[getOtherPlayerType().playerIndex()].xPos)
        otherCharacter.position.y = CGFloat(gameModel.players[getOtherPlayerType().playerIndex()].yPos)
        otherCharacter.size = CGSize(width:180*scaleChar, height:180*scaleChar)
        otherCharacter.zRotation = CGFloat(gameModel.players[getOtherPlayerType().playerIndex()].zRot)
        otherCharacter.isInfected = gameModel.players[getOtherPlayerType().playerIndex()].isInfected
        let newInd=(gameModel.players[getOtherPlayerType().playerIndex()].textureIndex-(gameModel.players[getOtherPlayerType().playerIndex()].textureIndex%4))/4
        if(otherCharacter.isInfected){
            otherCharacter.texture=ZwalkSprites[newInd]
        } else {
            otherCharacter.texture=walkSprites[newInd]
        }
    }
    
    
    func initialize(Match: GKMatch) {
        self.match = Match
        self.gameModel = GameModel()
        self.match?.delegate = self
        savePlayers()
    }
    
    private func savePlayers() {
        if self.match?.expectedPlayerCount == 2 {
            guard let player2Name = match?.players.first?.displayName else { return }
            let player1 = Player(displayName: GKLocalPlayer.local.displayName)
            let player2 = Player(displayName: player2Name)
                
            gameModel.players = [player1, player2]
                
            gameModel.players.sort { (player1, player2) -> Bool in
                player1.displayName < player2.displayName
            }
            sendData()
        }
    }
    
    override func didMove(to view: SKView) {
        let scaleMap=CGFloat(10*scaleChar)
        super.didMove(to: view)
        dimDash.alpha=0.4
        map.anchorPoint=CGPoint(x:0,y:0)
        map.position=CGPoint(x:0,y:0)
        back.anchorPoint=CGPoint(x:0,y:0)
        back.position=CGPoint(x:-screenWidth/2,y:-screenHeight/2)
        joystick.position = CGPoint(x: screenWidth/6, y: screenHeight/6)
        character.position = CGPoint(x: 500, y: 300)
        character.size = CGSize(width:180*scaleChar, height:180*scaleChar)
        testInfected.position=CGPoint(x: 300, y: 500)
        testInfected.size = CGSize(width:180*scaleChar, height:180*scaleChar)
        character.isInfected=false
        testInfected.isInfected=true
        testInfected.texture = ZwalkSprites[2]
        dimDash.size=CGSize(width: 100, height: 100)
        dimDash.position=CGPoint(x:5*screenWidth/6, y: screenHeight/6)
        dimDash.isHidden=true
        dashButton=UIButton(frame:CGRect(x: -50+5*screenWidth/6, y: -50+5*screenHeight/6, width: 100, height: 100))
        dashButton.setImage(UIImage(named: "dash"), for: UIButton.State.normal)
        dashButton.addTarget(self, action: #selector(self.dash), for: UIControl.Event.allTouchEvents)
        back.size = CGSize(width:map.size.width*scaleMap+screenWidth,height:map.size.height*scaleMap+screenHeight)
        map.size = CGSize(width:map.size.width*scaleMap, height:map.size.height*scaleMap)
        joystick.alpha = 0.5
        self.camera = cam
        self.addChild(back)
        self.addChild(cam)
                //        joystick.name = "joystick"
        self.addChild(map)
        self.addChild(joystick)
        self.addChild(character)
        self.addChild(testInfected)
        for w in arrayWall{
            self.addChild(w)
        }
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        self.addChild(dimDash)
        self.addChild(otherCharacter)
    }
    override func sceneDidLoad() {
        joystick.handleImage = UIImage(named: "shadedDark01.png")
        joystick.baseImage = UIImage(named: "shadedDark07.png")
        joystick.alpha = 0.5
        camera?.addChild(joystick)
        makeWalls()
        //Creating rectangle level border
        let rect = CGRect(origin: CGPoint(x: -2500, y: -2500), size: CGSize(width: 5000, height: 5000))
        let borderindicator = SKShapeNode(rect: rect)
        borderindicator.lineWidth = 50
        borderindicator.alpha = 0.5
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        self.addChild(borderindicator)
        character.physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2, center: character.position) // 1
        character.physicsBody?.isDynamic = true // 2
        character.physicsBody?.categoryBitMask = PhysicsCategory.character // 3
        character.physicsBody?.contactTestBitMask = PhysicsCategory.wall // 4
        character.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
        for w in arrayWall{
            w.physicsBody = SKPhysicsBody(rectangleOf:w.size) // 1
            w.physicsBody?.isDynamic = true // 2
            w.physicsBody?.categoryBitMask =  PhysicsCategory.wall// 3
            w.physicsBody?.contactTestBitMask = PhysicsCategory.character // 4
            w.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
        }
//        otherCharacter.physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2, center: character.position) // 1
//        otherCharacter.physicsBody?.isDynamic = true // 2
//        otherCharacter.physicsBody?.categoryBitMask = PhysicsCategory.character // 3
//        otherCharacter.physicsBody?.contactTestBitMask = PhysicsCategory.character// 4
//        otherCharacter.physicsBody?.collisionBitMask = PhysicsCategory.none
        testInfected.physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2, center: character.position) // 1
        testInfected.physicsBody?.isDynamic = true // 2
        testInfected.physicsBody?.categoryBitMask = PhysicsCategory.character // 3
        testInfected.physicsBody?.contactTestBitMask = PhysicsCategory.character// 4
        testInfected.physicsBody?.collisionBitMask = PhysicsCategory.none
        
        
        
        
    }
    func sendData() {
            guard let match = match else { return }
            
            do {
                guard let data = gameModel.encode() else { return }
                try match.sendData(toAllPlayers: data, with: .reliable)
            } catch {
                print("Send data failed")
            }
    }
    func characterHitCharacter(character1: Character, character2:Character){
        if((character1.isInfected)&&(!character2.isInfected)){
            character2.isInfected=true
            self.view?.addSubview(dashButton)
            speedScale=CGFloat(0.9)
        } else if((character2.isInfected)&&(!character1.isInfected)){
            character1.isInfected=true
            self.view?.addSubview(dashButton)
            speedScale=CGFloat(0.9)
        }
    }
    func characterHitWall(wall: Wall, character: SKSpriteNode) {
        if (self.character.position.y+27<=wall.position.y-wall.size.height/2+15){
            hitwallbottom=true
            wall.side = "bottom"
        }else
        if (self.character.position.x+27<=wall.position.x-wall.size.width/2+15){
            hitwallleft=true
            wall.side = "left"
        }else
        if (self.character.position.x-27>=wall.position.x+wall.size.width/2-15){
            hitwallright=true
            wall.side = "right"
        }else
        if (self.character.position.y-27>=wall.position.y+wall.size.height/2-15){
            hitwalltop=true
            wall.side = "top"
        }
    }
    func characterLeftWall(wall: Wall, character: SKSpriteNode) {
        if (wall.side == "bottom"){
          hitwallbottom=false
          wall.side = " "
          for w in arrayWall{
            if(w.side == "bottom"){
              hitwallbottom=true
            }
          }
        }else
        if (wall.side == "left"){
          hitwallleft=false
          wall.side = " "
          for w in arrayWall{
            if(w.side == "left"){
              hitwallleft=true
            }
          }
        }else
        if (wall.side == "right"){
          hitwallright=false
          wall.side = " "
          for w in arrayWall{
            if(w.side == "right"){
              hitwallright=true
            }
          }
        }else
        if (wall.side == "top"){
          hitwalltop=false
          wall.side = " "
          for w in arrayWall{
            if(w.side == "top"){
              hitwalltop=true
            }
          }
        }
      }
    
    override func update(_ currentTime: TimeInterval) {
        let velocityx=self.joystick.velocity.x*speedScale
        let velocityy=self.joystick.velocity.y*speedScale
        if(boundaryx==false){
        if (self.character.position.x + (velocityx)<character.size.width/2){
            self.character.position.x=character.size.width/2
            boundaryx=true
        } else if (self.character.position.x + (velocityx)>map.size.width-character.size.width/2){
            self.character.position.x=map.size.width-character.size.width/2
            boundaryx=true
        } else {
            boundaryx=false
        }
        }
        if(boundaryy==false){
        if (self.character.position.y + (velocityy)<character.size.height/2){
            self.character.position.y=character.size.height/2
            boundaryy=true
        } else if (self.character.position.y + (velocityy)>map.size.height-character.size.height/2){
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
                if ((hitwalltop&&velocityy<0)||(hitwallbottom&&velocityy>0)) {
                    self.character.position = CGPoint(x: self.character.position.x, y: self.character.position.y)
                } else {
                    self.character.position = CGPoint(x: self.character.position.x, y: self.character.position.y+(velocityy))
                }
            }
            else if boundaryy{
                if ((hitwallright&&velocityx<0)||(hitwallleft&&velocityx>0)) {
                    self.character.position = CGPoint(x: self.character.position.x, y: self.character.position.y)
                } else {
                    self.character.position = CGPoint(x: self.character.position.x+(velocityx), y: self.character.position.y)
                }
            }
        } else {
            xmovement = true
            ymovement = true
            if ((hitwallright&&velocityx<0)||(hitwallleft&&velocityx>0)) {
                xmovement = false
            }
            if ((hitwalltop&&velocityy<0)||(hitwallbottom&&velocityy>0)) {
                ymovement = false
            }
            if (xmovement&&ymovement) {
                self.character.position = CGPoint(x: self.character.position.x+(velocityx), y: self.character.position.y+(velocityy))
                
            } else if (xmovement) {
                self.character.position = CGPoint(x: self.character.position.x+(velocityx), y: self.character.position.y)
            } else if (ymovement) {
                self.character.position = CGPoint(x: self.character.position.x, y: self.character.position.y+(velocityy))
            } else {
                self.character.position = CGPoint(x: self.character.position.x, y: self.character.position.y)
            }
        }
        camera?.position = character.position
        joystick.position = CGPoint(x:camera!.position.x-(2*screenWidth)/6, y: camera!.position.y-(2*screenHeight)/6)
        dimDash.position=CGPoint(x:camera!.position.x+(2*screenWidth)/6, y: camera!.position.y-(2*screenHeight)/6)

        if(character.isInfected){
            if(joystick.velocity == CGPoint(x: 0,y: 0)){
                ind=8
                character.texture = ZwalkSprites[(ind-(ind%4))/4]
            } else {
                if ind>31{
                    ind=0
                }
                character.texture = ZwalkSprites[(ind-(ind%4))/4]
                ind+=1
                character.zRotation=joystick.angular
            }
        }else{
            if(joystick.velocity == CGPoint(x: 0,y: 0)){
                ind=8
                character.texture = walkSprites[(ind-(ind%4))/4]
            } else {
                if ind>31{
                    ind=0
                }
                character.texture = walkSprites[(ind-(ind%4))/4]
                ind+=1
                character.zRotation=joystick.angular
            }
        }
        
        
        boundaryx = false
        boundaryy = false
        if(startCounter==true){
            counter+=1
            if(counter==15){
                speedScale=CGFloat(0.9)
                counter=0
                startCounter=false
            }
        }
        if(startTimer==true){
            timerActionButton+=1
            if(timerActionButton==660){
//                speedScale=CGFloat(1)
                timerActionButton=0
                startTimer=false
                dimDash.isHidden=true
                self.view?.addSubview(dashButton)
            }
        }
        let localPlayer = getLocalPlayerType()
        gameModel.players[localPlayer.playerIndex()].xPos = Float(self.character.position.x)
        gameModel.players[localPlayer.playerIndex()].yPos = Float(self.character.position.y)
        gameModel.players[localPlayer.playerIndex()].zRot = Float(self.character.zRotation)
        gameModel.players[localPlayer.playerIndex()].isInfected = self.character.isInfected
        gameModel.players[localPlayer.playerIndex()].textureIndex = ind
        sendData()
        updateUI()
    }
    
    func getLocalPlayerType() -> PlayerType {
            if gameModel.players.first?.displayName == GKLocalPlayer.local.displayName {
                return .one
            } else {
                return .two
            }
    }
    func getOtherPlayerType() -> PlayerType {
            if gameModel.players.first?.displayName == GKLocalPlayer.local.displayName {
                return .two
            } else {
                return .one
            }
    }
    
    func makeWalls(){
        let imgName="clearPNG"
        let h=map.size.height*3
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:1.44*288), Position: CGPoint(x:1.26*288,y:h-0.47*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.83*288, height:0.13*288), Position: CGPoint(x:0.43*288,y:h-1.28*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:1.44*288), Position: CGPoint(x:1.9*288,y:h-0*288)))
        
        //Library area
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:1.73*288), Position: CGPoint(x:2.39*288,y:h-0.87*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:1.73*288), Position: CGPoint(x:3.01*288,y:h-0.87*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:1.73*288), Position: CGPoint(x:3.63*288,y:h-0.87*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:2.76*288), Position: CGPoint(x:4.2*288,y:h-0.49*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.93*288, height:0.13*288), Position: CGPoint(x:1.9*288,y:h-3.24*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:3.73*288), Position: CGPoint(x:1.26*288,y:h-2.48*288)))
        //rest of left stuff
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.78*288, height:0.13*288), Position: CGPoint(x:0*288,y:h-3.96*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:0.64*288), Position: CGPoint(x:0.78*288,y:h-5.39*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:0.64*288), Position: CGPoint(x:0.3*288,y:h-4.41*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:0.64*288), Position: CGPoint(x:0.3*288,y:h-6.5*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:0.73*288), Position: CGPoint(x:1.26*288,y:h-6.78*288)))
        //park walls
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:2.3*288, height:0.13*288), Position: CGPoint(x:2.03*288,y:h-5.19*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:1.01*288), Position: CGPoint(x:1.9*288,y:h-5.19*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:0.71*288), Position: CGPoint(x:1.9*288,y:h-6.79*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:4.08*288, height:0.13*288), Position: CGPoint(x:4.85*288,y:h-5.19*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.8*288, height:0.8*288), Position: CGPoint(x:4.89*288,y:h-6.09*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.38*288, height:0.52*288), Position: CGPoint(x:6.96*288,y:h-6.23*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.38*288, height:0.52*288), Position: CGPoint(x:7.79*288,y:h-6.23*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.38*288, height:0.52*288), Position: CGPoint(x:8.62*288,y:h-6.23*288)))
        //lake walls
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.58*288, height:0.47*288), Position: CGPoint(x:2.32*288,y:h-3.73*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:2.25*288, height:0.47*288), Position: CGPoint(x:4.2*288,y:h-3.73*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.99*288, height:0.47*288), Position: CGPoint(x:6.75*288,y:h-3.73*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:1.17*288), Position: CGPoint(x:1.9*288,y:h-3.38*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288, height:0.96*288), Position: CGPoint(x:9.08*288,y:h-3.24*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:2.44*288, height:0.13*288), Position: CGPoint(x:4.2*288,y:h-3.24*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.55*288, height:0.13*288), Position: CGPoint(x:7.55*288,y:h-3.24*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:4.13*288, height:0.13*288), Position: CGPoint(x:1.9*288,y:h-4.55*288)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.97*288, height:0.13*288), Position: CGPoint(x:6.74*288,y:h-4.55*288)))

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
        if((firstBody.categoryBitMask==secondBody.categoryBitMask)&&(firstBody.categoryBitMask==PhysicsCategory.character)){
            if let character1 = firstBody.node as? Character,
              let character2 = secondBody.node as? Character {
                characterHitCharacter(character1: character1, character2: character2)
            }
        }
      if ((firstBody.categoryBitMask & PhysicsCategory.character != 0) &&
          (secondBody.categoryBitMask & PhysicsCategory.wall != 0)) {
        if let character = firstBody.node as? SKSpriteNode,
          let wall = secondBody.node as? SKSpriteNode {
            characterHitWall(wall: wall as! Wall, character: character)
        }
      }
    }
    func didEnd(_ contact: SKPhysicsContact) {
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
            characterLeftWall(wall: wall as! Wall, character: character)
        }
      }
    }
}

extension GameScene: GKMatchDelegate {
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        guard let model = GameModel.decode(data: data) else { return }
        gameModel = model
    }
}


