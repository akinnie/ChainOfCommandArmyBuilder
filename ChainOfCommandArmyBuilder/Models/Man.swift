//
//  Man.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import Foundation

enum SmallArm: Codable {
    case pistol, rifle, smg, carbine, slr, noneSupport
}

protocol Man: Codable {
    var weapons: [SmallArm] { get }
}

struct Soldier: Man, Codable {
    var weapons: [SmallArm]
}