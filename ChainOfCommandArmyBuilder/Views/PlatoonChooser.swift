//
//  PlatoonChooser.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/26/24.
//

import SwiftUI

struct PlatoonChooser: View {
    @State var selectedNationality: Nationality?
    @State var selectedPlatoonType: Platoon?
    @Binding var nationalities: [Nationality]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selectedNationality?.name ?? "Please Select", selection: $selectedNationality) {
                        ForEach(nationalities, id: \.self) {
                            Text($0.name)
                        }
                    }
                }
            }
            .navigationTitle("Select Nationality")
        }
    }
}

#Preview {
    struct NationalityBindingContainer: View {
        @State
        private var nationalities: [Nationality]
        
        init() {
            let leader = Leader(rating: .senior, weapons: [.carbine])
            let leader1 = Leader(rating: .junior, weapons: [.rifle])
            let leader2 = Leader(rating: .junior, weapons: [.smg])
            nationalities = [Nationality(
                name: "Test",
                platoons: [
                    Platoon(rating: 0, training: .regular, squads: [
                        Squad(leader: leader1, teams: [Team(supportWeapon: nil, soldiers: [Soldier(weapons: [.rifle])], leader: nil)]),
                        Squad(leader: leader2, teams: [Team(supportWeapon: nil, soldiers: [Soldier(weapons: [.rifle])], leader: nil)])
                    ], hq: Headquarters(commander: leader, secondInCommand: nil, soldiers: nil, supportTeams: nil)
                           )
                ]), Nationality(name: "Some Other", platoons: [])]
        }
        
        var body: some View {
            PlatoonChooser(nationalities: $nationalities)
        }
    }
    
    return NationalityBindingContainer()
}
