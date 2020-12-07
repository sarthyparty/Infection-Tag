//
//  Zombie.swift
//  Infection Tag
//
//  Created by 64002170 on 12/7/20.
//

import SpriteKit

class Zombie: Character {
    
    scene: GameSceneSolo
    
    init(gameScene: GameSceneSolo){
        super.init(isInfected: true)
        self.scene = gameScene
    }
    
    func getRandomPosition() -> CGPoint{
        var xPos:Float
        var yPos:Float
        var isNotIntersecting = true
        repeat{
            xPos=Float.random(0..<screenWidth)
            yPos=Float.random(0..<screenHeight)
            for (wall in self.scene.arrayWall)
        }while(isNotIntersecting)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
