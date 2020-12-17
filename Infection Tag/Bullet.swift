//
//  Bullet.swift
//  Infection Tag
//
//  Created by 64000774 on 12/17/20.
//

//
//  Gun.swift
//  Infection Tag
//
//  Created by 64000774 on 12/15/20.
//

import SpriteKit

class Bullet: SKSpriteNode {
    
    init(pos: CGPoint, ang: CGFloat) {
//        self.id = ID
        // Make a texture from an image, a color, and size
        let texture = ZwalkSprites[2]

        let color = UIColor.clear
        let size = CGSize(width: 30, height: 30)
            // Call the designated initializer
        super.init(texture: texture, color: color, size: size)
        self.zRotation = ang
        self.position = pos
        
    }
    
    func setPosition() {
        let x = self.position.x + 10*cos(self.zRotation + CGFloat(Float.pi))
        let y = self.position.y + 10*sin(self.zRotation + CGFloat(Float.pi))
        self.position = CGPoint(x: x, y: y)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
