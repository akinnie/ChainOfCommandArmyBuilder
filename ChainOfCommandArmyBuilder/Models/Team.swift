//
//  Team.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation
enum SupportWeapon: String, Codable {
    case assaultRifle, lmgBeltFed, lmgCartridge, tripodMG, hmg, atRocket, atRifle

    var rof: Int {
        switch self {
        case .assaultRifle: 3
        case .lmgCartridge: 6
        case .lmgBeltFed:   8
        case .hmg:          8
        case .tripodMG:     10
        default: 1
        }
    }
}

struct Team: Codable {
    let supportWeapon: SupportWeapon?
    let soldiers: [Soldier]
    let leader: Leader?
}
