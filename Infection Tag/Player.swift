//
//  Player.swift
//  Infection Tag
//
//  Created by 64000774 on 11/23/20.
//

import Foundation
import UIKit
import SpriteKit

struct Player: Codable {
    var displayName: String
    var xPos: Float = 100
    var yPos: Float = 100
    var zRot: Float = 0
    var isInfected: Bool = false
    var textureIndex: Int = 8
}

