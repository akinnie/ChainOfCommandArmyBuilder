//
//  ContentView.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import SwiftUI

struct ContentView: View {
//    @Binding var selectedNationality: Nationality?
    
    @ObservedObject var viewModel: NationalitiesViewModel

    var body: some View {
        VStack {
            Text("Chain of Command Army Builder")
                .font(.title2)
                .padding()
            Text("Nationality:")
            Picker("Choose a Nationality", selection: $viewModel.selectedNationality) {
                ForEach(viewModel.nationalities, id: \.self) {
                    Text($0.name)
                }
            }

            Text("You selected \(viewModel.selectedNationality?.name ?? "no selection")")
            Spacer()
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
            ContentView(viewModel: NationalitiesViewModel(nationalities: nationalities))
        }
    }
    
    return NationalityBindingContainer()
}
