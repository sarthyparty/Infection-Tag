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
    var scale: CGFloat
    init(char: Character, scale: CGFloat) {
//        self.id = ID
        // Make a texture from an image, a color, and size
        let texture = SKTexture(imageNamed: "Pistol")

        let color = UIColor.clear
        let size = CGSize(width: 30*scale, height: 30*scale)
        self.scale=scale
        self.character = char
            // Call the designated initializer
        super.init(texture: texture, color: color, size: size)
        
    }
    
    func setPosition() {
        self.zRotation=character.zRotation+CGFloat(Float.pi/2)
        var x:CGFloat
        var y:CGFloat
        x =  CGFloat(25*self.scale*cos(self.character.zRotation+CGFloat(Float.pi/4)) + self.character.position.x)
        y =  CGFloat(25*self.scale*sin(self.character.zRotation+CGFloat(Float.pi/4)) + self.character.position.y)
        self.position = CGPoint(x:x, y:y)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
