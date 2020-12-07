//
//  Zombie.swift
//  Infection Tag
//
//  Created by 64002170 on 12/7/20.
//

import SpriteKit

class Zombie: Character {
    
//    var sceneSolo: GameSceneSolo
    
    init(){
        super.init(isInfected: true)
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
