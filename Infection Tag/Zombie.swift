//
//  Zombie.swift
//  Infection Tag
//
//  Created by 64002170 on 12/7/20.
//

import SpriteKit

class Zombie: Character {
    
    init(){
        super.init(isInfected: true)
        super.position=
    }
    
    func getRandomPosition() -> CGPoint{
        var xPos:Float
        var yPos:Float
        do{
            xPos=Float.Rand
        }while()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
