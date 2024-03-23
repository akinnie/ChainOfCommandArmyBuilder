//
//  Team.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation
enum SupportWeapon: Codable {
    case lmgBeltFed, lmgCartridge, tripodMG, hmg

    var rof: Int {
        switch self {
        case .lmgCartridge: 6
        case .lmgBeltFed:   8
        case .hmg:          8
        case .tripodMG:     10
        }
    }
}

struct Team: Codable {
    let supportWeapon: SupportWeapon?
    let soldiers: [Soldier]
    let leader: Leader
}
