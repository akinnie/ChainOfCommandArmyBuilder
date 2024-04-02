//
//  Nationality.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/25/24.
//

import Foundation

struct RootData: Codable {
    let nationalities: [Nationality]
}

struct Nationality: Identifiable, Hashable, Codable {
    var id: String { name }
    let name: String
    let platoons: [Platoon]

    // Equatable conformance
    static func == (lhs: Nationality, rhs: Nationality) -> Bool {
        lhs.name == rhs.name
    }

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    init(name: String, platoons: [Platoon]) {
        self.name = name
        self.platoons = platoons
    }

    // Decodable
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.platoons = try container.decode([Platoon].self, forKey: .platoons)
    }
}
