//
//  Man.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation

enum SmallArm: String, Codable {
    case pistol, rifle, smg, carbine, slr, slCarbine, noneSupport
}

protocol Man: Codable {
    var weapons: [SmallArm] { get }
}

struct Soldier: Man, Identifiable, Codable {
    var id: UUID = UUID()
    var weapons: [SmallArm]

    init(id: UUID = UUID(), weapons: [SmallArm]) {
        self.id = id
        self.weapons = weapons
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedId = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.id = decodedId ?? UUID()
        self.weapons = try container.decode([SmallArm].self, forKey: .weapons)
    }
}
