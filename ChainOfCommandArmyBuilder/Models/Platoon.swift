//
//  Platoon.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation
enum Training: String, Codable {
    case green, regular, elite
}

struct Headquarters: Identifiable, Codable {
    var id: UUID = UUID()
    let commander: Leader
    let secondInCommand: Leader?
    let soldiers: [Soldier]?

    let supportTeams: [Team]?

    init(id: UUID = UUID(), commander: Leader, secondInCommand: Leader?, soldiers: [Soldier]?, supportTeams: [Team]?) {
        self.id = id
        self.commander = commander
        self.secondInCommand = secondInCommand
        self.soldiers = soldiers
        self.supportTeams = supportTeams
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedId = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.id = decodedId ?? UUID()
        self.commander = try container.decode(Leader.self, forKey: .commander)
        self.secondInCommand = try container.decodeIfPresent(Leader.self, forKey: .secondInCommand)
        self.soldiers = try container.decodeIfPresent([Soldier].self, forKey: .soldiers)
        self.supportTeams = try container.decodeIfPresent([Team].self, forKey: .supportTeams)
    }
}

struct Platoon: Identifiable, Hashable, Codable {
    static func == (lhs: Platoon, rhs: Platoon) -> Bool {
        lhs.id == rhs.id
    }

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: UUID = UUID()
    let rating: Int
    let training: Training
    
    let squads: [Squad]
    let hq: Headquarters

    init(id: UUID = UUID(), rating: Int, training: Training, squads: [Squad], hq: Headquarters) {
        self.id = id
        self.rating = rating
        self.training = training
        self.squads = squads
        self.hq = hq
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedId = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.id = decodedId ?? UUID()
        self.rating = try container.decode(Int.self, forKey: .rating)
        self.training = try container.decode(Training.self, forKey: .training)
        self.squads = try container.decode([Squad].self, forKey: .squads)
        self.hq = try container.decode(Headquarters.self, forKey: .hq)
    }
}
