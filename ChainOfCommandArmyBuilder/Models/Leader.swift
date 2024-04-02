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

struct Leader: Man, Identifiable, Codable {
    var id: UUID = UUID()
    var rating: LeaderRating
    var weapons: [SmallArm]

    init(id: UUID = UUID(), rating: LeaderRating, weapons: [SmallArm]) {
        self.id = id
        self.rating = rating
        self.weapons = weapons
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedId = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.id = decodedId ?? UUID()
        self.rating = try container.decode(LeaderRating.self, forKey: .rating)
        self.weapons = try container.decode([SmallArm].self, forKey: .weapons)
    }
}
