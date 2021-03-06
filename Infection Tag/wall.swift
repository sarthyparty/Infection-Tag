//
//  Character.swift
//  Infection Tag
//
//  Created by 64000774 on 10/21/20.
//

import SpriteKit

class Wall: SKSpriteNode {
    
    var side: String = ""

    init(imageName: String, siz: CGSize, Position: CGPoint) {
        // Make a texture from an image, a color, and size
        let texture = SKTexture(imageNamed: imageName)

        let color = UIColor.clear
        let size = siz

        // Call the designated initializer
        super.init(texture: texture, color: color, size: size)

        // Set physics properties
//        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
//        physicsBody?.categoryBitMask = 1
//        physicsBody?.friction = 0.6
//        physicsBody?.mass = 0.5
        self.position = CGPoint(x:Position.x+size.width/2,y:Position.y-size.height/2)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
