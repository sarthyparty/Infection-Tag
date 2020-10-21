//
//  Character.swift
//  Infection Tag
//
//  Created by 64000774 on 10/21/20.
//

import SpriteKit

class Character: SKSpriteNode {

    init(isInfected: Bool) {
        // Make a texture from an image, a color, and size
        let texture = SKTexture(imageNamed: "walk1")

        let color = UIColor.clear
        let size = texture.size()

        // Call the designated initializer
        super.init(texture: texture, color: color, size: size)

        // Set physics properties
//        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
//        physicsBody?.categoryBitMask = 1
//        physicsBody?.friction = 0.6
//        physicsBody?.mass = 0.5
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
