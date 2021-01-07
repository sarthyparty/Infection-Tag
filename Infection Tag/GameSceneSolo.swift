//
//  GameScene.swift
//  Infection Tag
//
//  Created by 64000774 on 10/14/20.
//
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let originalWidth = CGFloat(1024)
let originalHeight = CGFloat(766)
let defaults = UserDefaults.standard
var scale1 = CGFloat.minimum(screenWidth/originalWidth, screenHeight/originalHeight)
var scaleChar=CGFloat(0.3)
var score = 0
var ammoCount=0

import SpriteKit
import GameplayKit
import GameKit

//var myID = ""
//var local_data = Data(capacity: 8)


struct PhysicsCategory {
  static let none      : UInt32 = 0
  static let all       : UInt32 = UInt32.max
  static let character1   : UInt32 = 0b1// 1
  static let wall: UInt32 = 0b10      // 2
    static let zombie: UInt32 = 0b11
    static let bullet: UInt32 = 0b100
}

class GameSceneSolo: SKScene, SKPhysicsContactDelegate {
    
    var tempDimDash=true
    var jChangeX:CGFloat=CGFloat(defaults.integer(forKey: "jX"))
    var jChangeY:CGFloat=CGFloat(defaults.integer(forKey: "jY"))
    var jChangeSize:CGFloat=CGFloat(defaults.double(forKey: "jSize"))
    var indexZ=0
    var isServer = false
    var joystick = TLAnalogJoystick(withDiameter: 200*scale1)
    var character = Character(isInfected: false)
    var cam = SKCameraNode()
    var scoreLabel = SKLabelNode()
    var pauseLabel = SKLabelNode()
    var highScore = defaults.integer(forKey: "highScore")
    var map=SKSpriteNode(imageNamed: "mapFINAL")
    var back=SKSpriteNode(imageNamed: "black")
    var dimDash=SKSpriteNode(imageNamed:"dash")
    var dimShoot=SKSpriteNode(imageNamed:"Shoot_button")
    var newShoot=MSButtonNode(img:UIImage(named: "Shoot_button")!, size: CGSize(width: 100*scale1, height: 100*scale1))
//    var newShoot2=MSButtonNode(img:UIImage(named: "Shoot_button")!, size: CGSize(width: 100*scale1, height: 100*scale1))
//    var shootButton : UIButton=UIButton(type: UIButton.ButtonType.custom)
    var testInfecteds:[Zombie] = [Zombie]()
//    var otherCharacter: Character = Character(isInfected: false, ID: "HELLO")
    
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
    var newDash = MSButtonNode(img:UIImage(named: "dash")!, size: CGSize(width: 100*scale1, height: 100*scale1))
//    var dashButton : UIButton=UIButton(type: UIButton.ButtonType.custom)
    var hi:SKView?=nil
    var speedScale=CGFloat(1)
    var counter=0
    var timerActionButton=0
    var startTimer=false
    var startCounter=false
    var zombieSpawnTimer=0
    var bullets: [Bullet] = [Bullet]()
    var shotBullets: [Bullet] = [Bullet]()
    var gun: Gun?
    var scoreText=NSMutableAttributedString(string:"Score: "+String(0))
    var pauseText=NSMutableAttributedString(string:"Game paused")
    let attributesScore:[NSAttributedString.Key:Any] = [.strokeColor: UIColor.white, .strokeWidth: -3, .font: UIFont(name: "Futura", size: 40*scale1)!, .foregroundColor: UIColor.black]
    let attributesPause:[NSAttributedString.Key:Any] = [.strokeColor: UIColor.white, .strokeWidth: -3, .font: UIFont(name: "Futura", size: 70*scale1)!, .foregroundColor: UIColor.black]
    var pauseButton=MSButtonNode(img:UIImage(named: "pause")!, size: CGSize(width: 100*scale1, height: 100*scale1))
    let attributesSettings:[NSAttributedString.Key:Any] = [.strokeColor: UIColor.white, .strokeWidth: -3, .font: UIFont(name: "Futura", size: 45*scale1)!, .foregroundColor: UIColor.black]
    var joystickSizeLabel = SKLabelNode()
    var joystickSizeText=NSMutableAttributedString(string:"Joystick Size:")
    var jSizeSmall=MSButtonNode(img:UIImage(named: "arrowDown")!, size: CGSize(width: 70*scale1, height: 70*scale1))
    var jSizeBig=MSButtonNode(img:UIImage(named: "arrowUp")!, size: CGSize(width: 70*scale1, height: 70*scale1))
//    var dashSizeLabel = SKLabelNode()
//    var dashSizeText=NSMutableAttributedString(string:"Dash Button Size:")
//    var shootSizeLabel = SKLabelNode()
//    var shootSizeText=NSMutableAttributedString(string:"Shoot Button Size:")
    var joystickPosLabel = SKLabelNode()
    var joystickPosText=NSMutableAttributedString(string:"Joystick Position:")
    var jPosXDown=MSButtonNode(img:UIImage(named: "arrowLeft")!, size: CGSize(width: 70*scale1, height: 70*scale1))
    var jPosXUp=MSButtonNode(img:UIImage(named: "arrowRight")!, size: CGSize(width: 70*scale1, height: 70*scale1))
    var jPosYDown=MSButtonNode(img:UIImage(named: "arrowDown")!, size: CGSize(width: 70*scale1, height: 70*scale1))
    var jPosYUp=MSButtonNode(img:UIImage(named: "arrowUp")!, size: CGSize(width: 70*scale1, height: 70*scale1))
//    var dashPosLabel = SKLabelNode()
//    var dashPosText=NSMutableAttributedString(string:"Dash Button Position:")
//    var shootPosLabel = SKLabelNode()
//    var shootPosText=NSMutableAttributedString(string:"Shoot Button Position:")
    
//    var match: GKMatch?
//    private var gameModel: GameModel!
    
//    @objc func shoot() {
//        for i in 0...bullets.count-1 {
//            if bullets[i].pickedUp {
//                bullets[i].shoot(char: self.gun!, angle: self.gun!.zRotation+CGFloat(Float.pi))
//                shotBullets.append(bullets[i])
//                self.addChild(bullets[i])
//                self.bullets.remove(at: i)
//                return
//            }
//        }
//    }
    
//    @objc func dash() {
//        speedScale=CGFloat(3)
//        startCounter=true
//        startTimer=true
//        dashButton.removeFromSuperview()
//        dimDash.isHidden=false
//    }
    
//    func updateUI() {
//        if gameModel.players.count != 2 {
//            savePlayers()
//        }
//        otherCharacter.position.x = CGFloat(gameModel.players[getOtherPlayerType().playerIndex()].xPos)
//        otherCharacter.position.y = CGFloat(gameModel.players[getOtherPlayerType().playerIndex()].yPos)
//        otherCharacter.size = CGSize(width:180*scaleChar, height:180*scaleChar)
//        otherCharacter.zRotation = CGFloat(gameModel.players[getOtherPlayerType().playerIndex()].zRot)
//        otherCharacter.isInfected = gameModel.players[getOtherPlayerType().playerIndex()].isInfected
//        let newInd=(gameModel.players[getOtherPlayerType().playerIndex()].textureIndex-(gameModel.players[getOtherPlayerType().playerIndex()].textureIndex%4))/4
//        if(otherCharacter.isInfected){
//            otherCharacter.texture=ZwalkSprites[newInd]
//        } else {
//            otherCharacter.texture=walkSprites[newInd]
//        }
//    }
    
    
//    func initialize(Match: GKMatch) {
//        self.match = Match
//        self.gameModel = GameModel()
//        self.match?.delegate = self
//        savePlayers()
//        if getLocalPlayerType().playerIndex() == 0 {
//            self.match?.chooseBestHostingPlayer(completionHandler: makeServer)
//        }
//    }
    
//    func makeServer(player: GKPlayer?) -> Void {
//        var l_player = [GKPlayer]()
//        l_player.append(player!)
//        do {
//            try self.match?.send(local_data, to: l_player, dataMode: GKMatch.SendDataMode.reliable)
//
//        } catch is Error {
//            print("this game is messed up")
//        }
//    }
    
//    private func savePlayers() {
//        if self.match?.expectedPlayerCount == 2 {
//            guard let player2Name = match?.players.first?.displayName else { return }
//            let player1 = Player(displayName: GKLocalPlayer.local.displayName)
//            let player2 = Player(displayName: player2Name)
//
//            gameModel.players = [player1, player2]
//
//            gameModel.players.sort { (player1, player2) -> Bool in
//                player1.displayName < player2.displayName
//            }
//            sendData()
//        }
//    }
    
    override func didMove(to view: SKView) {
//        pauseButton?.texture=SKTexture(imageNamed: "pause.fill")
        
        hi=self.view!
        score = 0
        ammoCount=0
        scoreText=NSMutableAttributedString(string: "Score: " + String(score)+" Bullets: "+String(ammoCount))
        scoreText.addAttributes(attributesScore, range: NSMakeRange(0, scoreText.length))
        scoreLabel.attributedText = scoreText
        let scaleMap=CGFloat(10*scaleChar*scale1)
        super.didMove(to: view)
        dimDash.alpha=0.4
        dimShoot.alpha=0.4
//        dashButton.alpha=0.7
//        testInfecteds.append(Zombie())
        map.anchorPoint=CGPoint(x:0,y:0)
        map.position=CGPoint(x:0,y:0)
        back.anchorPoint=CGPoint(x:0,y:0)
        back.position=CGPoint(x:-screenWidth/2,y:-screenHeight/2)
        joystick.diameter=200*scale1*(self.jChangeSize+1)
        joystick.position = CGPoint(x: screenWidth/6, y: screenHeight/6)
        scoreLabel.position = CGPoint(x: screenWidth/2, y: screenHeight - screenHeight/6)
        
        
//        testInfecteds[0].position=getRandomPosition()
//        testInfecteds[0].size = CGSize(width:180*scaleChar, height:180*scaleChar)
//        testInfecteds[0].isInfected=true
//        testInfecteds[0].texture = ZwalkSprites[2]
//        character.isInfected=false
        dimDash.size=CGSize(width: 100*scale1, height: 100*scale1)
//        dimDash.position=CGPoint(x:5*screenWidth/6, y: screenHeight/3)
        dimDash.isHidden=true
        dimShoot.size=CGSize(width: 100*scale1, height: 100*scale1)
//        dimShoot.position=CGPoint(x:5*screenWidth/6, y: screenHeight/3)
        dimShoot.isHidden=true
//        dashButton=UIButton(frame:CGRect(x: -50+2*screenWidth/6, y: -50+5*screenHeight/6, width: 100*scale1, height: 100*scale1))
//        dashButton.setImage(UIImage(named: "dash"), for: UIButton.State.normal)
//        dashButton.addTarget(self, action: #selector(self.dash), for: UIControl.Event.allTouchEvents)
//        shootButton=UIButton(frame:CGRect(x: -50+5*screenWidth/6, y: -50+5*screenHeight/6, width: 100*scale1, height: 100*scale1))
//        shootButton.setImage(UIImage(named: "Shoot_button"), for: UIButton.State.normal)
//        shootButton.addTarget(self, action: #selector(self.shoot), for: UIControl.Event.allTouchEvents)
        back.size = CGSize(width:map.size.width*scaleMap+screenWidth,height:map.size.height*scaleMap+screenHeight)
        map.size = CGSize(width:map.size.width*scaleMap, height:map.size.height*scaleMap)
        joystick.alpha = 0.5
        jSizeSmall?.selectedHandler = {
            if (self.jChangeSize>=(-0.26)){
                self.jChangeSize-=0.02
                defaults.setValue(self.jChangeSize, forKey: "jSize")
                self.joystick.diameter=200*scale1*(self.jChangeSize+1)
            }
        }
        jSizeBig?.selectedHandler = {
            if (self.jChangeSize<=(0.26)){
                self.jChangeSize+=0.02
                defaults.setValue(self.jChangeSize, forKey: "jSize")
                self.joystick.diameter=200*scale1*(self.jChangeSize+1)
            }
        }
        jPosXUp?.selectedHandler = {
            self.jChangeX+=5
            defaults.setValue(self.jChangeX, forKey: "jX")
            self.joystick.position = CGPoint(x:self.camera!.position.x-(2*screenWidth)/6+self.jChangeX, y: self.camera!.position.y-(2*screenHeight)/6+self.jChangeY)
        }
        jPosXDown?.selectedHandler = {
            self.jChangeX-=5
            defaults.setValue(self.jChangeX, forKey: "jX")
            self.joystick.position = CGPoint(x:self.camera!.position.x-(2*screenWidth)/6+self.jChangeX, y: self.camera!.position.y-(2*screenHeight)/6+self.jChangeY)
        }
        jPosYUp?.selectedHandler = {
            self.jChangeY+=5
            defaults.setValue(self.jChangeY, forKey: "jY")
            self.joystick.position = CGPoint(x:self.camera!.position.x-(2*screenWidth)/6+self.jChangeX, y: self.camera!.position.y-(2*screenHeight)/6+self.jChangeY)
        }
        jPosYDown?.selectedHandler = {
            self.jChangeY-=5
            defaults.setValue(self.jChangeY, forKey: "jY")
            self.joystick.position = CGPoint(x:self.camera!.position.x-(2*screenWidth)/6+self.jChangeX, y: self.camera!.position.y-(2*screenHeight)/6+self.jChangeY)
        }
        newShoot?.selectedHandler = {
            for i in 0...self.bullets.count-1 {
                if self.bullets[i].pickedUp {
                    self.bullets[i].shoot(char: self.gun!, angle: self.gun!.zRotation+CGFloat(Float.pi))
                    self.shotBullets.append(self.bullets[i])
                    self.addChild(self.bullets[i])
                    self.bullets.remove(at: i)
                    ammoCount-=1
                    return
                    
                }
            }
        }
        newDash?.selectedHandler = {
            self.speedScale=CGFloat(3)
            self.startCounter=true
            self.startTimer=true
            self.newDash?.removeFromParent()
            self.dimDash.isHidden=false
            
        }
        self.camera = cam
        pauseButton?.selectedHandler = {
            if(self.isPaused==false){
                self.jSizeSmall?.position = CGPoint(x: self.camera!.position.x-screenWidth/4, y: self.camera!.position.y-50)
                self.jSizeBig?.position = CGPoint(x: self.camera!.position.x-screenWidth/4, y: self.camera!.position.y+50)
                self.jPosYDown?.position = CGPoint(x: self.camera!.position.x+screenWidth/4, y: self.camera!.position.y-70)
                self.jPosYUp?.position = CGPoint(x: self.camera!.position.x+screenWidth/4, y: self.camera!.position.y+70)
                self.jPosXDown?.position = CGPoint(x: self.camera!.position.x+screenWidth/4-70, y: self.camera!.position.y)
                self.jPosXUp?.position = CGPoint(x: self.camera!.position.x+screenWidth/4+70, y: self.camera!.position.y)
                self.addChild(self.jSizeSmall!)
                self.addChild(self.jSizeBig!)
                self.addChild(self.jPosXDown!)
                self.addChild(self.jPosXUp!)
                self.addChild(self.jPosYDown!)
                self.addChild(self.jPosYUp!)
                self.pauseText.addAttributes(self.attributesPause, range: NSMakeRange(0, self.pauseText.length))
                self.pauseLabel.attributedText = self.pauseText
                self.pauseLabel.position = CGPoint(x: self.camera!.position.x, y: self.camera!.position.y+(3*screenHeight)/7-75*scale1)
                self.addChild(self.pauseLabel)
                self.joystickSizeText.addAttributes(self.attributesSettings, range: NSMakeRange(0, self.joystickSizeText.length))
                self.joystickSizeLabel.attributedText = self.joystickSizeText
                self.joystickSizeLabel.position = CGPoint(x: self.camera!.position.x-screenWidth/4, y: self.camera!.position.y+(screenHeight)/5)
                self.addChild(self.joystickSizeLabel)
//                self.dashSizeText.addAttributes(self.attributesSettings, range: NSMakeRange(0, self.dashSizeText.length))
//                self.dashSizeLabel.attributedText = self.dashSizeText
//                self.dashSizeLabel.position = CGPoint(x: self.camera!.position.x-screenWidth/4, y: self.camera!.position.y)
//                self.addChild(self.dashSizeLabel)
//                self.shootSizeText.addAttributes(self.attributesSettings, range: NSMakeRange(0, self.shootSizeText.length))
//                self.shootSizeLabel.attributedText = self.shootSizeText
//                self.shootSizeLabel.position = CGPoint(x: self.camera!.position.x-screenWidth/4, y: self.camera!.position.y-(screenHeight)/5)
//                self.addChild(self.shootSizeLabel)
                self.joystickPosText.addAttributes(self.attributesSettings, range: NSMakeRange(0, self.joystickPosText.length))
                self.joystickPosLabel.attributedText = self.joystickPosText
                self.joystickPosLabel.position = CGPoint(x: self.camera!.position.x+screenWidth/4, y: self.camera!.position.y+(screenHeight)/5)
                self.addChild(self.joystickPosLabel)
//                self.dashPosText.addAttributes(self.attributesSettings, range: NSMakeRange(0, self.dashPosText.length))
//                self.dashPosLabel.attributedText = self.dashPosText
//                self.dashPosLabel.position = CGPoint(x: self.camera!.position.x+screenWidth/4, y: self.camera!.position.y)
//                self.addChild(self.dashPosLabel)
//                self.shootPosText.addAttributes(self.attributesSettings, range: NSMakeRange(0, self.shootPosText.length))
//                self.shootPosLabel.attributedText = self.shootPosText
//                self.shootPosLabel.position = CGPoint(x: self.camera!.position.x+screenWidth/4, y: self.camera!.position.y-(screenHeight)/5)
//                self.addChild(self.shootPosLabel)
                self.newDash?.removeFromParent()
                for z in self.testInfecteds{
                    z.alpha=0.3
                }
                for b in self.bullets{
                    b.alpha=0.3
                }
                for sb in self.shotBullets{
                    sb.alpha=0.3
                }
                self.gun!.alpha=0.3
                self.tempDimDash=self.dimDash.isHidden
                self.dimDash.isHidden=false
                self.character.alpha=0.3
                self.map.alpha=0.3
                self.joystick.alpha=0.25
                self.newShoot?.removeFromParent()
                self.dimShoot.isHidden=false
            } else {
                self.dimShoot.isHidden=true
                self.addChild(self.newDash!)
                self.addChild(self.newShoot!)
                self.dimDash.isHidden=self.tempDimDash
                for z in self.testInfecteds{
                    z.alpha=1
                }
                for b in self.bullets{
                    b.alpha=1
                }
                for sb in self.shotBullets{
                    sb.alpha=1
                }
                self.gun!.alpha=1
                self.character.alpha=1
                self.map.alpha=1
                self.joystick.alpha=0.5
                self.newShoot?.alpha=1
                self.pauseLabel.removeFromParent()
                self.joystickSizeLabel.removeFromParent()
//                self.dashSizeLabel.removeFromParent()
//                self.shootSizeLabel.removeFromParent()
                self.joystickPosLabel.removeFromParent()
//                self.dashPosLabel.removeFromParent()
//                self.shootPosLabel.removeFromParent()
                self.jPosXDown?.removeFromParent()
                self.jPosXUp?.removeFromParent()
                self.jPosYUp?.removeFromParent()
                self.jPosYDown?.removeFromParent()
                self.jSizeSmall?.removeFromParent()
                self.jSizeBig?.removeFromParent()
            }
            self.isPaused.toggle()
            self.joystick.disabled.toggle()
            
            
        }
        
//        newShoot2?.selectedHandler = {
//            self.changeX+=5
//            self.joystick.position = CGPoint(x:self.camera!.position.x-(2*screenWidth)/6+self.changeX, y: self.camera!.position.y-(2*screenHeight)/6+self.changeY)
//        }
        self.addChild(back)
        self.addChild(cam)
        
                //        joystick.name = "joystick"
        self.addChild(map)
        self.addChild(joystick)
        self.addChild(character)
        self.addChild(self.scoreLabel)
        self.addChild(self.gun!)
        character.position = CGPoint(x: 500*scale1, y: 300*scale1)
        character.size = CGSize(width:180*scaleChar*scale1, height:180*scaleChar*scale1)
        
//        self.view?.addSubview(shootButton)
//        for z in testInfecteds{
//            self.addChild(z)
//        }
        for w in arrayWall{
            self.addChild(w)
        }
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        self.addChild(dimDash)
        self.addChild(dimShoot)
        self.addChild(pauseButton!)
        self.addChild(newDash!)
        self.addChild(newShoot!)
//        self.addChild(newShoot2!)
//        self.addChild(otherCharacter)
//        super.scaleMode = .aspectFit 
    }
    override func sceneDidLoad() {
        gun = Gun(char: self.character, scale: scale1)
//        scoreLabel.attributedText = NSAttributedString(string: "Score: " + String(score))
//        scoreLabel.color = SKColor(named: "orange")
        joystick.handleImage = UIImage(named: "shadedDark01.png")
        joystick.baseImage = UIImage(named: "shadedDark07.png")
        joystick.alpha = 0.5
        camera?.addChild(joystick)
        
        //Creating rectangle level border
//        let rect = CGRect(origin: CGPoint(x: -2500, y: -2500), size: CGSize(width: 5000, height: 5000))
//        let borderindicator = SKShapeNode(rect: rect)
//        borderindicator.lineWidth = 50
//        borderindicator.alpha = 0.5
//        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
//        self.addChild(borderindicator)
        makeWalls()
        for w in arrayWall{
            w.physicsBody = SKPhysicsBody(rectangleOf:w.size) // 1
            w.physicsBody?.isDynamic = true // 2
            w.physicsBody?.categoryBitMask =  PhysicsCategory.wall// 3
            w.physicsBody?.contactTestBitMask = PhysicsCategory.character1 // 4
            w.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
        }
        character.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "walk3"), alphaThreshold: 0.5, size: CGSize(width: character.size.width*scaleChar*scale1, height: character.size.height*scaleChar*scale1))// 1
        character.physicsBody?.isDynamic = true // 2
        character.physicsBody?.categoryBitMask = PhysicsCategory.character1 // 3
        character.physicsBody?.contactTestBitMask = PhysicsCategory.wall // 4
//        character.physicsBody?.collisionBitMask = PhysicsCategory.wall | PhysicsCategory.zombie // 5
       
//        otherCharacter.physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2, center: character.position) // 1
//        otherCharacter.physicsBody?.isDynamic = true // 2
//        otherCharacter.physicsBody?.categoryBitMask = PhysicsCategory.character // 3
//        otherCharacter.physicsBody?.contactTestBitMask = PhysicsCategory.character// 4
//        otherCharacter.physicsBody?.collisionBitMask = PhysicsCategory.none
        
//        testInfecteds[0].physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2, center: testInfecteds[0].position) // 1
//        testInfecteds[0].physicsBody?.isDynamic = true // 2
//        testInfecteds[0].physicsBody?.categoryBitMask = PhysicsCategory.zombie // 3
//        testInfecteds[0].physicsBody?.contactTestBitMask = PhysicsCategory.character// 4
//        testInfecteds[0].physicsBody?.collisionBitMask = PhysicsCategory.none
        
        
        
        
    }
    
    func getRandomPosition() -> CGPoint{
        var xPos:CGFloat
        var yPos:CGFloat
        var isIntersecting=false
        repeat{
            isIntersecting=false
            xPos=map.size.width*CGFloat(Float.random(in: 0..<1))
            yPos=map.size.height*CGFloat(Float.random(in: 0..<1))
            for wall in arrayWall{
                let z=Zombie(char: character, pos: CGPoint(x: xPos, y: yPos), inde: 0, radi: Float(180*scaleChar/2*scale1))
                z.size=CGSize(width:180*scaleChar*scale1, height:180*scaleChar*scale1)
                if wall.intersects(z){
                    isIntersecting=true
                }
            }
        }while(isIntersecting)
        return CGPoint(x: xPos, y: yPos)
    }
//    func sendData() {
//            guard let match = match else { return }
//
//            do {
//                guard let data = gameModel.encode() else { return }
//                try match.sendData(toAllPlayers: data, with: .reliable)
//            } catch {
//                print("Send data failed")
//            }
//    }

//    func characterHitCharacter(character1: Character, character2:Character){
//        if((character1.isInfected)&&(!character2.isInfected)){
//            character2.isInfected=true
//            self.view?.addSubview(dashButton)
//            speedScale=CGFloat(0.9)
//        } else if((character2.isInfected)&&(!character1.isInfected)){
//            character1.isInfected=true
//            self.view?.addSubview(dashButton)
//            speedScale=CGFloat(0.9)
//        }
//    }
//    func characterHitWall(wall: Wall, character: Character) {
//        if (self.character.position.y+27*scale<=wall.position.y-wall.size.height/2+15*scale){
//            hitwallbottom=true
//            wall.side = "bottom"
//        }else
//        if (self.character.position.x+27*scale<=wall.position.x-wall.size.width/2+15*scale){
//            hitwallleft=true
//            wall.side = "left"
//        }else
//        if (self.character.position.x-27*scale>=wall.position.x+wall.size.width/2-15*scale){
//            hitwallright=true
//            wall.side = "right"
//        }else
//        if (self.character.position.y-27*scale>=wall.position.y+wall.size.height/2-15*scale){
//            hitwalltop=true
//            wall.side = "top"
//        }
//    }
//    func characterLeftWall(wall: Wall, character: SKSpriteNode) {
//        if (wall.side == "bottom"){
//          hitwallbottom=false
//          wall.side = " "
//          for w in arrayWall{
//            if(w.side == "bottom"){
//              hitwallbottom=true
//            }
//          }
//        }else
//        if (wall.side == "left"){
//          hitwallleft=false
//          wall.side = " "
//          for w in arrayWall{
//            if(w.side == "left"){
//              hitwallleft=true
//            }
//          }
//        }else
//        if (wall.side == "right"){
//          hitwallright=false
//          wall.side = " "
//          for w in arrayWall{
//            if(w.side == "right"){
//              hitwallright=true
//            }
//          }
//        }else
//        if (wall.side == "top"){
//          hitwalltop=false
//          wall.side = " "
//          for w in arrayWall{
//            if(w.side == "top"){
//              hitwalltop=true
//            }
//          }
//        }
//      }
    func zombieHiZombie (zombie1: Zombie, zombie2: Zombie) {
        let newX = (zombie1.position.x + zombie2.position.x)/2
        let newY = (zombie1.position.y + zombie2.position.y)/2
        let newIteration=zombie1.iteration+zombie2.iteration
        if ((zombie1.iteration<8)&&(zombie2.iteration<8)){
            zombie1.position = CGPoint(x: newX, y: newY)
            if (newIteration>=8){
                zombie1.iteration=8
            } else {
                zombie1.iteration=newIteration
            }
            zombie1.update()
            zombie1.rad=zombie1.rad*1.2
            zombie2.removeFromParent()
            zombie1.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "walk3"), alphaThreshold: 0.5, size: zombie1.size)// 1
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let velocityx=self.joystick.velocity.x*speedScale*scale1
        let velocityy=self.joystick.velocity.y*speedScale*scale1
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
        joystick.position = CGPoint(x:camera!.position.x-(2*screenWidth)/6+jChangeX, y: camera!.position.y-(2*screenHeight)/6+jChangeY)
        dimDash.position=CGPoint(x:camera!.position.x+2*(screenWidth)/6, y: camera!.position.y-(2*screenHeight)/6+100*scale1)
        newDash?.position=CGPoint(x:camera!.position.x+2*(screenWidth)/6, y: camera!.position.y-(2*screenHeight)/6+100*scale1)
        pauseButton?.position=CGPoint(x:camera!.position.x+(3*screenWidth)/7, y: camera!.position.y+(3*screenHeight)/7)
        newShoot?.position=CGPoint(x:camera!.position.x+2*(screenWidth)/6, y: camera!.position.y-(2*screenHeight)/6)
        dimShoot.position=CGPoint(x:camera!.position.x+2*(screenWidth)/6, y: camera!.position.y-(2*screenHeight)/6)
//        newShoot2?.position=CGPoint(x:camera!.position.x+2*(screenWidth)/6, y: camera!.position.y+(2*screenHeight)/6)
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
                self.addChild(newDash!)//                self.view?.addSubview(dashButton)
            }
        }
        if(zombieSpawnTimer%180==0){
            let pos=getRandomPosition()
            testInfecteds.append(Zombie(char: character, pos: pos, inde: testInfecteds.endIndex, radi: Float(180*scaleChar/2*scale1)))
            testInfecteds.last?.size = CGSize(width:180*scaleChar*scale1, height:180*scaleChar*scale1)
            testInfecteds.last?.isInfected=true
            testInfecteds.last?.texture = ZwalkSprites[2]
            self.addChild(testInfecteds.last!)
//            testInfecteds.last?.physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2*scale/*, center: testInfecteds.last!.position*/) // 1
            testInfecteds.last?.physicsBody?.isDynamic = false // 2
            testInfecteds.last?.physicsBody?.categoryBitMask = PhysicsCategory.zombie // 3

            testInfecteds.last?.physicsBody?.contactTestBitMask = PhysicsCategory.character1 | PhysicsCategory.zombie// 4
            testInfecteds.last?.physicsBody?.collisionBitMask = PhysicsCategory.none
            testInfecteds.last?.speedZ=testInfecteds.last!.speedZ*scale1
            testInfecteds.last?.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "walk3"), alphaThreshold: 0.5, size: testInfecteds.last!.size)
            testInfecteds.last?.physicsBody?.contactTestBitMask = PhysicsCategory.character1 | PhysicsCategory.zombie// 4
//            indexZ+=1
            zombieSpawnTimer = 0
        }
        if (zombieSpawnTimer%60==0) {
            let pos = getRandomPosition()
            let bullet = Bullet(pos: pos, scale: scale1)
            self.bullets.append(bullet)
            self.addChild(bullets.last!)
            bullets.last?.physicsBody?.isDynamic = false // 2
            bullets.last?.physicsBody?.categoryBitMask = PhysicsCategory.zombie // 3

            bullets.last?.physicsBody?.contactTestBitMask = PhysicsCategory.character1 | PhysicsCategory.bullet// 4
            bullets.last?.physicsBody?.collisionBitMask = PhysicsCategory.none
            bullets.last?.physicsBody = SKPhysicsBody(texture: bullet.texture!, alphaThreshold: 0.5, size: bullets.last!.size)
            bullets.last?.physicsBody?.contactTestBitMask = PhysicsCategory.character1 | PhysicsCategory.bullet// 4
            bullets.last?.physicsBody?.allowsRotation=false
        }
        for b in bullets {
            if (b.parent != nil) {
                for b1 in b.physicsBody!.allContactedBodies(){
                    if b1==character.physicsBody {
                        b.pickUp()
                        b.size = CGSize(width: 30*scale1, height: 30*scale1)
                        b.physicsBody = SKPhysicsBody(texture: b.texture!, alphaThreshold: 0.5, size: b.size)
                        
                    }
                }
            }
        }
        zombieSpawnTimer+=1
        for z in testInfecteds{
            z.move()
        }
        for z in testInfecteds{
            if(z.parent != nil){
                for z1 in z.physicsBody!.allContactedBodies(){
                    if character.physicsBody==z1{
                        let scene=playAgainMenu(fileNamed: "playAgainMenu")
                        let theScene = scene
                        var skView:SKView?
                        do{
                            skView = try hi
                        } catch{
                            print("it no work")
                        }
//                        newDash?.removeFromParent()
//                        dimDash.isHidden=true
//                        newShoot?.removeFromParent()
                        skView?.presentScene(theScene)
                    }
                }
            }
        }
        for z in testInfecteds{
            for z1 in z.physicsBody!.allContactedBodies(){
                for z2 in testInfecteds{
                    if z2.physicsBody==z1{
                        zombieHiZombie(zombie1: z, zombie2: z2)
                    }
                }
            }
        }
        score+=1
        if (score%10==0){
            if score>highScore{
                highScore=score
                if highScore>defaults.integer(forKey: "highScore"){
                    defaults.setValue(highScore, forKey: "highScore")
                }
            }
            scoreText=NSMutableAttributedString(string: "Score: " + String(score)+" Bullets: "+String(ammoCount))
        scoreText.addAttributes(attributesScore, range: NSMakeRange(0, scoreText.length))
        scoreLabel.attributedText = scoreText
        }
        camera?.position = character.position
        scoreLabel.position = CGPoint(x:camera!.position.x, y: camera!.position.y+(3*screenHeight)/7)
       
        self.gun?.setPosition()
        for shotB in shotBullets{
            for b in shotB.physicsBody!.allContactedBodies(){
                for z1 in testInfecteds{
                    if z1.physicsBody==b{
                        z1.goBoom()
                        shotB.removeFromParent()
                    }
                }
                for w in arrayWall{
                    if w.physicsBody==b{
                        shotB.removeFromParent()
                    }
                }
            }
        }
        if shotBullets.count >= 1 {
            for i in 0...shotBullets.count-1 {
                shotBullets[i].setPosition()
                if shotBullets[i].doneShooting() {
                    print(shotBullets.count)
                    shotBullets.remove(at: i)
                    print(shotBullets.count)
                    break
                }
            }
        }
        
//        if testInfecteds.count>=1{
//        for i in testInfecteds.count-1...0{
//            if (testInfecteds[i].parent==nil){
//                testInfecteds.remove(at: i)
//            }
//        }
//        }
        
//        let localPlayer = getLocalPlayerType()
//        gameModel.players[localPlayer.playerIndex()].xPos = Float(self.character.position.x)
//        gameModel.players[localPlayer.playerIndex()].yPos = Float(self.character.position.y)
//        gameModel.players[localPlayer.playerIndex()].zRot = Float(self.character.zRotation)
//        gameModel.players[localPlayer.playerIndex()].isInfected = self.character.isInfected
//        gameModel.players[localPlayer.playerIndex()].textureIndex = ind
//        sendData()
//        updateUI()
    }
    
//    func getLocalPlayerType() -> PlayerType {
//            if gameModel.players.first?.displayName == GKLocalPlayer.local.displayName {
//                return .one
//            } else {
//                return .two
//            }
//    }
//    func getOtherPlayerType() -> PlayerType {
//            if gameModel.players.first?.displayName == GKLocalPlayer.local.displayName {
//                return .two
//            } else {
//                return .one
//            }
//    }
    
    func makeWalls(){
        let imgName="clearPNG"
        let h=map.size.height*3
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:1.44*288*scale1), Position: CGPoint(x:1.26*288*scale1,y:(h-0.47*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.83*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:0.43*288*scale1,y:(h-1.28*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:1.44*288*scale1), Position: CGPoint(x:1.9*288*scale1,y:(h-0*288)*scale1)))
        
        //Library area
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:1.73*288*scale1), Position: CGPoint(x:2.39*288*scale1,y:(h-0.87*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:1.73*288*scale1), Position: CGPoint(x:3.01*288*scale1,y:(h-0.87*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:1.73*288*scale1), Position: CGPoint(x:3.63*288*scale1,y:(h-0.87*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:2.76*288*scale1), Position: CGPoint(x:4.2*288*scale1,y:(h-0.49*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.93*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:1.9*288*scale1,y:(h-3.24*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:3.73*288*scale1), Position: CGPoint(x:1.26*288*scale1,y:(h-2.48*288)*scale1)))
        //rest of left stuff
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.78*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:0*288*scale1,y:(h-3.96*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:0.64*288*scale1), Position: CGPoint(x:0.78*288*scale1,y:(h-5.39*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:0.64*288*scale1), Position: CGPoint(x:0.3*288*scale1,y:(h-4.41*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:0.64*288*scale1), Position: CGPoint(x:0.3*288*scale1,y:(h-6.5*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:0.73*288*scale1), Position: CGPoint(x:1.26*288*scale1,y:(h-6.78*288)*scale1)))
        //park walls
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:2.3*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:2.03*288*scale1,y:(h-5.19*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:1.01*288*scale1), Position: CGPoint(x:1.9*288*scale1,y:(h-5.19*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:0.71*288*scale1), Position: CGPoint(x:1.9*288*scale1,y:(h-6.79*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:4.08*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:4.85*288*scale1,y:(h-5.19*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.8*288*scale1, height:0.8*288*scale1), Position: CGPoint(x:4.89*288*scale1,y:(h-6.09*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.38*288*scale1, height:0.52*288*scale1), Position: CGPoint(x:6.96*288*scale1,y:(h-6.23*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.38*288*scale1, height:0.52*288*scale1), Position: CGPoint(x:7.79*288*scale1,y:(h-6.23*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.38*288*scale1, height:0.52*288*scale1), Position: CGPoint(x:8.62*288*scale1,y:(h-6.23*288)*scale1)))
        //lake walls
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.58*288*scale1, height:0.47*288*scale1), Position: CGPoint(x:2.32*288*scale1,y:(h-3.73*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:2.25*288*scale1, height:0.47*288*scale1), Position: CGPoint(x:4.2*288*scale1,y:(h-3.73*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.99*288*scale1, height:0.47*288*scale1), Position: CGPoint(x:6.75*288*scale1,y:(h-3.73*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:1.17*288*scale1), Position: CGPoint(x:1.9*288*scale1,y:(h-3.38*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:0.13*288*scale1, height:0.96*288*scale1), Position: CGPoint(x:9.08*288*scale1,y:(h-3.24*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:2.44*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:4.2*288*scale1,y:(h-3.24*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.55*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:7.55*288*scale1,y:(h-3.24*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:4.13*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:1.9*288*scale1,y:(h-4.55*288)*scale1)))
        arrayWall.append(Wall(imageName: imgName, siz: CGSize(width:1.97*288*scale1, height:0.13*288*scale1), Position: CGPoint(x:6.74*288*scale1,y:(h-4.55*288)*scale1)))
    }
    
}
//extension GameSceneSolo: SKPhysicsContactDelegate {
//
//    func didBegin(_ contact: SKPhysicsContact) {
//      // 1
//      var firstBody: SKPhysicsBody
//      var secondBody: SKPhysicsBody
//      if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
//        firstBody = contact.bodyA
//        secondBody = contact.bodyB
//      } else {
//        firstBody = contact.bodyB
//        secondBody = contact.bodyA
//      }
//
//      // 2
////        if((firstBody.categoryBitMask==secondBody.categoryBitMask)&&(firstBody.categoryBitMask==PhysicsCategory.character1)){
////            if let character1 = firstBody.node as? Character,
////              let character2 = secondBody.node as? Character {
////                characterHitCharacter(character1: character1, character2: character2)
////            }
////        }
////        if ((firstBody.categoryBitMask == PhysicsCategory.character1) &&
////                (secondBody.categoryBitMask == PhysicsCategory.wall)) {
////            if let character = firstBody.node as? SKSpriteNode,
////           let wall = secondBody.node as? SKSpriteNode {
////                characterHitWall(wall: wall as! Wall, character: character as! Character)
////            }
////        }
////        if ((firstBody.categoryBitMask == PhysicsCategory.wall) &&
////            (secondBody.categoryBitMask == PhysicsCategory.character1)) {
////          if let wall = firstBody.node as? SKSpriteNode,
////            let character = secondBody.node as? SKSpriteNode {
////              characterHitWall(wall: wall as! Wall, character: character as! Character)
////          }
////        }
//        if ((firstBody.categoryBitMask == PhysicsCategory.character1) &&
//                (secondBody.categoryBitMask == PhysicsCategory.zombie)) {
//            let scene=MainMenu(fileNamed: "MainMenu")
//            let theScene = scene
//            let skView = view!
//            newDash?.removeFromParent()
//            dimDash.isHidden=true
//            skView.presentScene(theScene)
//        }
//        if ((firstBody.categoryBitMask == PhysicsCategory.zombie) &&
//            (secondBody.categoryBitMask == PhysicsCategory.character1)) {
//            let scene=MainMenu(fileNamed: "MainMenu")
//            let theScene = scene
//            let skView = view!
//            newDash?.removeFromParent()
//            dimDash.isHidden=true
//            skView.presentScene(theScene)
//        }
//        if ((firstBody.categoryBitMask == PhysicsCategory.zombie) &&
//            (secondBody.categoryBitMask == PhysicsCategory.zombie)) {
//            if let zombie1 = firstBody.node as? SKSpriteNode,
//              let zombie2 = secondBody.node as? SKSpriteNode {
//                zombieHiZombie(zombie1: zombie1 as! Zombie, zombie2: zombie2 as! Zombie)
//            }
//        }
//
//    }
//    func didEnd(_ contact: SKPhysicsContact) {
//      // 1
//      var firstBody: SKPhysicsBody
//      var secondBody: SKPhysicsBody
//      if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
//        firstBody = contact.bodyA
//        secondBody = contact.bodyB
//      } else {
//        firstBody = contact.bodyB
//        secondBody = contact.bodyA
//      }
//
//       2
//        if ((firstBody.categoryBitMask == PhysicsCategory.character1) &&
//            (secondBody.categoryBitMask == PhysicsCategory.wall)) {
//          if let character = firstBody.node as? SKSpriteNode,
//            let wall = secondBody.node as? SKSpriteNode {
//              characterLeftWall(wall: wall as! Wall, character: character as! Character)
//          }
//        }
//          if ((firstBody.categoryBitMask == PhysicsCategory.wall) &&
//              (secondBody.categoryBitMask == PhysicsCategory.character1)) {
//            if let wall = firstBody.node as? SKSpriteNode,
//              let character = secondBody.node as? SKSpriteNode {
//                characterLeftWall(wall: wall as! Wall, character: character as! Character)
//            }
//          }
//    }
//}

//extension GameScene: GKMatchDelegate {
//    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
//        if data == local_data {
//            isServer = true
//            otherCharacter.physicsBody = SKPhysicsBody(circleOfRadius: 180*scaleChar/2, center: character.position) // 1
//            otherCharacter.physicsBody?.isDynamic = true // 2
//            otherCharacter.physicsBody?.categoryBitMask = PhysicsCategory.character // 3
//            otherCharacter.physicsBody?.contactTestBitMask = PhysicsCategory.character // 4
//            otherCharacter.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
//        }
//        guard let model = GameModel.decode(data: data) else { return }
//        gameModel = model
//    }
//}


