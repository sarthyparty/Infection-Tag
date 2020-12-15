//
//  Gun.swift
//  Infection Tag
//
//  Created by 64000774 on 12/15/20.
//

import SpriteKit

class Gun: SKSpriteNode {
    
//    var id: String
    var character: Character
    init(char: Character) {
//        self.id = ID
        // Make a texture from an image, a color, and size
        let texture = walkSprites[2]

        let color = UIColor.clear
        let size = texture.size()
        self.character = char
            // Call the designated initializer
        super.init(texture: texture, color: color, size: size)
        
    }
    
    func setPosition() {
        let x =  CGFloat(10*cos(self.character.zRotation) + self.character.position.x)
        let y =  CGFloat(10*sin(self.character.zRotation) + self.character.position.y)
        self.position = CGPoint(x:x, y:y)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
