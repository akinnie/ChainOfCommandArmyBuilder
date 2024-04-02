//
//  Squad.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation

struct Squad: Identifiable, Codable {
    var id: UUID = UUID()
    let leader: Leader
    let teams: [Team]

    init(id: UUID = UUID(), leader: Leader, teams: [Team]) {
        self.id = id
        self.leader = leader
        self.teams = teams
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedId = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.id = decodedId ?? UUID()
        self.leader = try container.decode(Leader.self, forKey: .leader)
        self.teams = try container.decode([Team].self, forKey: .teams)
    }
}
