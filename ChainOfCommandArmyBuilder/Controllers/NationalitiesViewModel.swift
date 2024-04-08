//
//  SelectionViewModel.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 4/1/24.
//

import Foundation

class NationalitiesViewModel: ObservableObject {

    @Published var nationalities: [Nationality]
    @Published var selectedNationality: Nationality?

    init(nationalities: [Nationality] = []) {
        self.nationalities = nationalities
        if nationalities.isEmpty {
            do {
                self.nationalities = try DataController.shared.loadNationalities().get()
            } catch let error {
                print(error)
            }
        }
    }
}
