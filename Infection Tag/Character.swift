//
//  Character.swift
//  Infection Tag
//
//  Created by 64000774 on 10/21/20.
//

import SpriteKit

var arraySprites :[SKTexture] = [SKTexture]()


class Character: SKSpriteNode {
    
    init(isInfected: Bool) {
        // Make a texture from an image, a color, and size
        arraySprites.append(SKTexture(imageNamed: "walk1"))
        arraySprites.append(SKTexture(imageNamed: "walk2"))
        arraySprites.append(SKTexture(imageNamed: "walk3"))
        arraySprites.append(SKTexture(imageNamed: "walk4"))
        arraySprites.append(SKTexture(imageNamed: "walk5"))
        arraySprites.append(SKTexture(imageNamed: "walk6"))
        arraySprites.append(SKTexture(imageNamed: "walk7"))
        arraySprites.append(SKTexture(imageNamed: "walk8"))
        let texture = arraySprites[2]

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
