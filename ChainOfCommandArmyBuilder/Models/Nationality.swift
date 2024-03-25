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

struct Nationality: Codable {
    let name: String
    let platoons: [Platoon]
}
