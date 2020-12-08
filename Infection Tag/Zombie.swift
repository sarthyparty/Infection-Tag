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
//        let  = -atan2((char.position.x - pos.x), (char.position.y - pos.y))
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
