//
//  GameModel.swift
//  Infection Tag
//
//  Created by 64000774 on 11/23/20.
//

import Foundation
import UIKit
import GameKit

struct GameModel: Codable {
    var players: [Player] = []
    var time: Int = 180

    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }

    static func decode(data: Data) -> GameModel? {
        return try? JSONDecoder().decode(GameModel.self, from: data)
    }
}

