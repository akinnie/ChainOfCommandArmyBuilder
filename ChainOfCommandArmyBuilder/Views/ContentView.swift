//
//  ContentView.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: NationalitiesViewModel
    
    init(viewModel: NationalitiesViewModel = NationalitiesViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Text("Chain of Command Army Builder")
                .font(.title2)
                .padding()
            Text("Nationality:")
            Picker("Choose a Nationality", selection: $viewModel.selectedNationality) {
                Text("Please Select")
                ForEach(viewModel.nationalities, id: \.self) { nationality in
                    Text(nationality.name).tag(nationality as Nationality?)
                }
            }

            if let selectedNationality = viewModel.selectedNationality {
                PlatoonChooser(viewModel: PlatoonChooserViewModel( selectedNationality: selectedNationality))
            }
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
                    Platoon(name: "Rifle", rating: 0, training: .regular, squads: [
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
