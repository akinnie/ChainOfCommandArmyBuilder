//
//  Platoon.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation
enum Training: Codable {
    case green, regular, elite
}

struct Platoon: Codable {
    let rating: Int
    let training: Training
    
    let squads: [Squad]
    let hq: Team
}
