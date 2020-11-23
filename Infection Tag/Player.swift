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

extension PlayerType {
    func enemyInfected() -> Bool {
        switch self {
        case .one:
            return false
        case .two:
            return true
        }
    }
    
    func selfInfected() -> Bool {
        switch self {
        case .one:
            return false
        case .two:
            return true
        }
    }
}
