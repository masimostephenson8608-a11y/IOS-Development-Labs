//
//  ContentView.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(GameInfo.self) var gameInfo
    
    var body: some View {
        NavigationStack {
            List(gameInfo.games) { game in
                NavigationLink {
                    // Game Detail View
                } label: {
                    HStack {
                        Text(game.title)
                            .font(.title.bold())
                        Spacer()
                        Text("Winning: \(game.winning?.name ?? "N/A")")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                    .padding(10)
                }
            }
        }
        .padding()
    }
}
