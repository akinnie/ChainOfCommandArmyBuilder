//
//  ContentView.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SelectionViewModel

    let noSelectionPrompt = "Please Select"

    init?(viewModel: SelectionViewModel, selectedNationality: Binding<Nationality?>? = nil) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Chain of Command Army Builder")
                .font(.title2)
                .padding()
            Text("Nationality:")
            Picker("Choose a Nationality", selection: $viewModel.selectedNationality) {
                if viewModel.selectedNationality == nil {
                    Text(noSelectionPrompt).tag(Optional<Nationality>.none)
                }

                ForEach(viewModel.nationalities, id: \.self) {
                    Text($0.name).tag(Optional($0))
                }
            }

            if let selectedNationality = viewModel.selectedNationality {
                Text("You selected \(selectedNationality.name)")
            }
            Spacer()
        }
    }
}

#Preview {
    struct NationalityBindingContainer: View {
        var nationalities: [Nationality]
        
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
            ContentView(viewModel: SelectionViewModel())
        }
    }
    
    return NationalityBindingContainer()
}
