//
//  Squad.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation

struct Squad: Codable {
    let leader: Leader
    let teams: [Team]
}
