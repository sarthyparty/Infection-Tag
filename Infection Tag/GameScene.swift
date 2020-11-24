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
//import Amplify
//import AmplifyPlugins

var myID = ""
//var playInDB: PlayerPos? = nil

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
    //    var otherCharacters :[Character] = [Character]()
//    var subscriptionUpdate: GraphQLSubscriptionOperation<PlayerPos>?
//    var subscriptionCreate: GraphQLSubscriptionOperation<PlayerPos>?
    
    
//    func createSubscriptions() {
//        subscriptionCreate = Amplify.API.subscribe(request: .subscription(of: PlayerPos.self, type: .onCreate), valueListener: { (subscriptionEvent) in
//            switch subscriptionEvent {
//            case .connection(let subscriptionConnectionState):
//                print("Subscription connect state is \(subscriptionConnectionState)")
//            case .data(let result):
//                switch result {
//                case .success(let createdPlayer):
//                    print("Successfully got todo from subscription: \(createdPlayer.id)")
//                    if createdPlayer.id != myID {
//                        let char = Character(isInfected: false, ID: createdPlayer.id)
//                        char.size = CGSize(width:180*self.scaleChar, height:180*self.scaleChar)
//                        self.otherCharacters.append(char)
//                        self.addChild(char)
//                    }
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            }
//        }) { result in
//            switch result {
//            case .success:
//                print("Subscription has been closed successfully")
//            case .failure(let apiError):
//                print("Subscription has terminated with \(apiError)")
//        subscriptionUpdate = Amplify.API.subscribe(request: .subscription(of: PlayerPos.self, type: .onUpdate), valueListener: { (subscriptionEvent) in
//            switch subscriptionEvent {
//            case .connection(let subscriptionConnectionState):
//                print("Subscription connect state is \(subscriptionConnectionState)")
//            case .data(let result):
//                switch result {
//                case .success(let updatedPlayer):
//                    for char in self.otherCharacters {
//                        if updatedPlayer.id == char.id {
//                            char.position.x = CGFloat(updatedPlayer.x)
//                            char.position.y = CGFloat(updatedPlayer.y)
//                            break
//                        }
//                    }
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            }
//        }) { result in
//            switch result {
//            case .success:
//                print("Subscription has been closed successfully")
//            case .failure(let apiError):
//                print("Subscription has terminated with \(apiError)")
//            }
//        }
//    }
    @objc func dash() {
        speedScale=CGFloat(3)
        startCounter=true
        startTimer=true
        dashButton.removeFromSuperview()
        dimDash.isHidden=false
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
        testInfected.physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2, center: character.position) // 1
        testInfected.physicsBody?.isDynamic = true // 2
        testInfected.physicsBody?.categoryBitMask = PhysicsCategory.character // 3
        testInfected.physicsBody?.contactTestBitMask = PhysicsCategory.character// 4
        testInfected.physicsBody?.collisionBitMask = PhysicsCategory.none
        
//        Amplify.API.query(request: .list(PlayerPos.self)) { event in
//            switch event {
//            case .success(let result):
//                switch result {
//                case .success(let players):
//                    print("Successfully retrieved list of players: \(players.count)")
//                    for player in players {
//                        if player.id == myID {
//                            continue
//                        }
//                        let char = Character(isInfected: false, ID: player.id)
//                        char.size = CGSize(width:180*self.scaleChar, height:180*self.scaleChar)
//                        self.otherCharacters.append(char)
//                        self.addChild(char)
//                    }
//
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            case .failure(let error):
//                print("Got failed event with error \(error)")
//            }
//        }

//        let player = PlayerPos(x: 400, y: 400, frameNum: 3)
//        Amplify.API.mutate(request: .create(player)) { event in
//            switch event {
//            case .success(let result):
//                switch result {
//                case .success(let player):
//                    print("Successfully created player: \(player.id)")
//                    myID = player.id
//                    playInDB = player
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            case .failure(let error):
//                print("Got failed event with error \(error)")
//            }
//        }
//
//
//        createSubscriptions()

        
        
        
        
        
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
//        playInDB?.x = Double(self.character.position.x)
//        playInDB?.y = Double(self.character.position.y)
//        if (playInDB != nil&&self.ymovement==false&&self.xmovement==false) {
//            Amplify.API.mutate(request: .update(playInDB!)) { event in
//                switch event {
//                case .success(let result):
//                    switch result {
//                    case .success(let player):
//                        myID = player.id
//                    case .failure(let error):
//                        print("Got failed result with \(error.errorDescription)")
//                    }
//                case .failure(let error):
//                    print("Got failed event with error \(error)")
//                }
//            }
//        }
        
        
        
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


