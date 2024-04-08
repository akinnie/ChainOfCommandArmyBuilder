//
//  PlatoonChooserViewModel.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 4/7/24.
//

import Foundation

class PlatoonChooserViewModel: ObservableObject {
    @Published var selectedPlatoon: Platoon?
    @Published var platoons: [Platoon]

    init(selectedNationality: Nationality) {
        self.platoons = selectedNationality.platoons
    }
}
