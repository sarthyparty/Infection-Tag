//
//  Character.swift
//  Infection Tag
//
//  Created by 64000774 on 10/21/20.
//

import Foundation
import SpriteKit

class Character: SKNode {
    var isInfected: Bool
    var image=SKSpriteNode(imageNamed: "walk1")
    override init() {
        if isInfected {
            //can u see
            //heyoooooooo
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}