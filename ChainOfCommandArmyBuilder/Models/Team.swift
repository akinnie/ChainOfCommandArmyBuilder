//
//  Team.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation
enum SupportWeapon: String, Codable {
    case assaultRifle, lmgBeltFed, lmgCartridge, tripodMG, hmg, atRocket, atRifle, mortar50, mortar60

    var rof: Int {
        switch self {
        case .assaultRifle: 3
        case .lmgCartridge: 6
        case .lmgBeltFed:   8
        case .hmg:          8
        case .tripodMG:     10
        case .mortar50:     2
        case .mortar60:     3
        default: 1
        }
    }
}

struct Team: Identifiable, Codable {
    var id: UUID = UUID()
    let supportWeapon: SupportWeapon?
    let soldiers: [Soldier]
    let leader: Leader?

    init(id: UUID = UUID(), supportWeapon: SupportWeapon?, soldiers: [Soldier], leader: Leader?) {
        self.id = id
        self.supportWeapon = supportWeapon
        self.soldiers = soldiers
        self.leader = leader
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedId = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.id = decodedId ?? UUID()
        self.supportWeapon = try container.decodeIfPresent(SupportWeapon.self, forKey: .supportWeapon)
        self.soldiers = try container.decode([Soldier].self, forKey: .soldiers)
        self.leader = try container.decodeIfPresent(Leader.self, forKey: .leader)
    }
}
