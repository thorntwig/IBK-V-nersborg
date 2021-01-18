//
//  Player.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-01-28.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class Player: Codable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.jerseyNumber == rhs.jerseyNumber
    }
    
    let firstName: String
    let lastName: String
    let jerseyNumber: Int
    let position: Position
    let games: Int
    let isHomeTeamPlayer: Bool

    enum Position: String, Codable, Hashable{
        case back
        case center
        case forward
        case målvakt
    }

}
