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
    var zRot: Float = 0
    var isInfected: Bool = false
}

enum PlayerType: String, Codable, CaseIterable {
    case one
    case two
}

extension PlayerType {
    func playerIndex() -> Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 0
        }
        
    }
}
