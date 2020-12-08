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
    
    init(char: Character, pos: CGPoint){
        self.character = char
        self.angle = -atan2((char.position.x - pos.x), (char.position.y - pos.y))
        super.init(isInfected: true)
        self.position = pos
        self.zRotation = angle
        
        
    }
    
    func move() {
        let perfectAng = -atan2((self.character.position.x - self.position.x), (self.character.position.y - self.position.y))
        self.zRotation = (perfectAng)/* - self.angle)/10 + self.angle*/
        self.position.x = self.position.x + (4 * cos(zRotation+CGFloat(Float.pi/4)))
        self.position.y = self.position.y + (4 * sin(zRotation+CGFloat(Float.pi/4)))
        self.angle = self.zRotation
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
