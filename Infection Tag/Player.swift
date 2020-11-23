//
//  Player.swift
//  Infection Tag
//
//  Created by 64000774 on 11/23/20.
//

import Foundation
import UIKit

struct Player: Codable {
    var displayName: String
    var xPos: Float = 100
    var yPos: Float = 100
}

enum PlayerType: String, Codable, CaseIterable {
    case one
    case two
}
