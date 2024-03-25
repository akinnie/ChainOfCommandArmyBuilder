//
//  Leader.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation

enum LeaderRating: String, Codable {
    case junior, superiorJunior, inferiorSenior, senior, superiorSenior

    var initiativePoints: Int {
        switch self {
        case .junior, .inferiorSenior: 2
        case .superiorJunior, .senior: 3
        case .superiorSenior: 4
        }
    }
}

struct Leader: Man, Codable {
    var rating: LeaderRating
    var weapons: [SmallArm]
}
