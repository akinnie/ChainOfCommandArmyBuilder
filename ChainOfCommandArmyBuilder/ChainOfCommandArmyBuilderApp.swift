//
//  ChainOfCommandArmyBuilderApp.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import SwiftUI

@main
struct ChainOfCommandArmyBuilderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SelectionViewModel())
        }
    }
}
