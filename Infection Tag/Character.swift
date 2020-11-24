//
//  Character.swift
//  Infection Tag
//
//  Created by 64000774 on 10/21/20.
//

import SpriteKit

var walkSprites :[SKTexture] = [SKTexture]()
var ZwalkSprites :[SKTexture] = [SKTexture]()


class Character: SKSpriteNode {
    
    var id: String
    var isInfected: Bool
    init(isInfected: Bool, ID: String) {
        walkSprites.append(SKTexture(imageNamed: "walk1"))
        walkSprites.append(SKTexture(imageNamed: "walk2"))
        walkSprites.append(SKTexture(imageNamed: "walk3"))
        walkSprites.append(SKTexture(imageNamed: "walk4"))
        walkSprites.append(SKTexture(imageNamed: "walk5"))
        walkSprites.append(SKTexture(imageNamed: "walk6"))
        walkSprites.append(SKTexture(imageNamed: "walk7"))
        walkSprites.append(SKTexture(imageNamed: "walk8"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk1"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk2"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk3"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk4"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk5"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk6"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk7"))
        ZwalkSprites.append(SKTexture(imageNamed: "Zwalk8"))
        self.id = ID
        // Make a texture from an image, a color, and size
        let texture = walkSprites[2]

        let color = UIColor.clear
        let size = texture.size()
        self.isInfected=isInfected
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
