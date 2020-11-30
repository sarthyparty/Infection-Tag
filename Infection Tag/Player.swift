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
    var isInfected: Bool = false
}

enum PlayerType: String, Codable, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
}

extension PlayerType {
    func playerIndex() -> Int {
        switch self {
        case .one:
            return 0
        case .two:
            return 1
        case .three:
            return 2
        case .four:
            return 3
        case .five:
            return 4
        case .six:
            return 5
        case .seven:
            return 6
        case .eight:
            return 7
        }
        
    }
}
