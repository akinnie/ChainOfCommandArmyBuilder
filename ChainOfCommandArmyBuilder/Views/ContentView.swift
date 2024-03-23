//
//  ContentView.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.coCCoverFinal)
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .opacity(0.5)
                VStack {
                    Text("Chain of Command Army Builder")
                    Button("Start") {
                        // do stuff
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
