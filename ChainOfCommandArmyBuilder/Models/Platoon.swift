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

struct Headquarters: Codable {
    let commander: Leader
    let secondInCommand: Leader?
    let soldiers: [Soldier]?

    let supportTeams: [Team]?
}

struct Platoon: Codable {
    let rating: Int
    let training: Training
    
    let squads: [Squad]
    let hq: Headquarters
}
