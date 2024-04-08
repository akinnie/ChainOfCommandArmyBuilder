//
//  PlatoonChooser.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/26/24.
//

import SwiftUI

struct PlatoonChooser: View {
    @State var selectedNationality: Nationality
    @State var selectedPlatoonType: Platoon?
    
    var body: some View {
        Picker("Please Select", selection: $selectedPlatoonType) {
            ForEach(selectedNationality.platoons, id: \.self) { platoon in
                Text(platoon.name).tag(platoon as Platoon?)
            }
        }
    }
}

#Preview {
    struct PlatoonBindingContainer: View {
        @State
        private var selectedNationality: Nationality
        
        init() {
            let leader = Leader(rating: .senior, weapons: [.carbine])
            let leader1 = Leader(rating: .junior, weapons: [.rifle])
            let leader2 = Leader(rating: .junior, weapons: [.smg])
            
            selectedNationality = Nationality(
                name: "Test",
                platoons: [
                    Platoon(name: "Rifle", rating: 0, training: .regular, squads: [
                        Squad(leader: leader1, teams: [Team(supportWeapon: nil, soldiers: [Soldier(weapons: [.rifle])], leader: nil)]),
                        Squad(leader: leader2, teams: [Team(supportWeapon: nil, soldiers: [Soldier(weapons: [.rifle])], leader: nil)])
                    ], hq: Headquarters(commander: leader, secondInCommand: nil, soldiers: nil, supportTeams: nil)
                    ),
                    Platoon(name: "Armored Rifle", rating: 0, training: .regular, squads: [
                        Squad(leader: leader1, teams: [Team(supportWeapon: nil, soldiers: [Soldier(weapons: [.rifle])], leader: nil)]),
                        Squad(leader: leader2, teams: [Team(supportWeapon: nil, soldiers: [Soldier(weapons: [.rifle])], leader: nil)])
                    ], hq: Headquarters(commander: leader, secondInCommand: nil, soldiers: nil, supportTeams: nil)
                    )
                ]
            )
        }

        var body: some View {
            PlatoonChooser(selectedNationality: selectedNationality)
        }
    }
    
    return PlatoonBindingContainer()
}
