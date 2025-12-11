//
//  ContentView.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
//    @Environment(GameInfo.self) var gameInfo
    @Query var games: [Game]
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            List(games, id: \.id) { game in
                NavigationLink {
                    GameDetailView(game: game)
                } label: {
                    HStack {
                        Image(systemName: game.icon)
                            .resizable()
                            .frame(width: 25, height: 25)
                        VStack {
                            Text(game.title)
                                .font(.title.bold())
                            HStack {
                                Text("Winning: ")
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                                Text("\(game.winning?.name ?? "N/A")")
                                    .font(.title3.bold())
                                    .foregroundStyle(.black)
                            }
                        }
                        Spacer()
                    }
                    .padding(10)
                }.swipeActions() {
                    Button("Delete") {
                        delete(game: game)
                    }.tint(.red)
                }
            }
            .toolbar {
                ToolbarItem() {
                    NavigationLink("+") {
                        NewGameView()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    func delete(game: Game) {
        context.delete(game)
    }
}
