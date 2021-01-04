//
//  Zombie.swift
//  Infection Tag
//
//  Created by 64002170 on 12/7/20.
//

import SpriteKit

class Zombie: Character {
    
//    var sceneSolo: GameSceneSolo
    var angle: CGFloat
    var character: Character
    var ind: Int
    var speedZ: CGFloat
    var rad: Float
    var iteration: Float
    
    init(char: Character, pos: CGPoint, inde: Int, radi:Float){
        self.character = char
        self.angle = -atan2((char.position.x - pos.x), (char.position.y - pos.y))
        self.ind = inde
        self.rad=radi
        self.speedZ = CGFloat(3)
        self.iteration = 1
        super.init(isInfected: true)
        self.position = pos
        self.zRotation = angle
        
    }
    
    func move() {
        let perfectAng = -atan2((self.character.position.x - self.position.x), (self.character.position.y - self.position.y))
        self.zRotation = perfectAng
        self.position.x = self.position.x + (speedZ * cos(self.angle+CGFloat(Float.pi/2)))
        self.position.y = self.position.y + (speedZ * sin(self.angle+CGFloat(Float.pi/2)))
        self.angle = self.zRotation
        if ind>31{
            ind=0
        }
        self.texture=ZwalkSprites[(ind-(ind%4))/4]
        ind+=1
    }
    
    func goBoom() -> Bool{
        if (iteration <= 1){
            self.removeFromParent()
            return true
        } else {
            iteration=iteration-1
            update()
            return false
        }
    }
    
    func update(){
        self.size=CGSize(width:180*scaleChar*CGFloat(scale1)*CGFloat(pow(1.2, iteration-1)), height:180*scaleChar*CGFloat(scale1)*CGFloat(pow(1.2, iteration-1)))
        self.physicsBody=SKPhysicsBody(texture: SKTexture(imageNamed: "walk3"), alphaThreshold: 0.5, size: self.size)
    }
//    func getRandomPosition() -> CGPoint{
//        var xPos:Float
//        var yPos:Float
//        var isNotIntersecting = true
//        repeat{
//            xPos=Float(screenWidth)*Float.random(in: 0..<1)
//            yPos=Float(screenHeight)*Float.random(in: 0..<1)
//            for wall in self.sceneSolo.arrayWall{
//                if self.sceneSolo.testInfected.physicsBody.int
//            }
//        }while(isNotIntersecting)
//    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
