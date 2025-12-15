//
//  ContentView.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import SwiftData
import SwiftUI

struct HomeScreen: View {
    @Query(sort: [SortDescriptor(\Game.orderIndex)], animation: .default)
    var games: [Game]
    
    @Environment(\.modelContext) var context

//    let nameSpace: Namespace.ID

    @State private var selectedGame: Game? = nil
    @State private var showingDetail = false

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(games, id: \.id) { game in
                        NavigationLink(destination: GameDetailView(game: game)) {
                            PlayerCell(game: game)
                                .swipeActions {
                                    Button("Delete") {
                                        delete(game: game)
                                    }.tint(.red)
                                }
                        }
                    }.onMove(perform: moveGames)
                }
            }
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("+") {
                        NewGameView(initialOrderIndex: games.count)
                    }
                }
            }//.ignoresSafeArea()
            .toolbarVisibility(showingDetail ? .hidden : .visible, for: .navigationBar)
        }
    }
 
    func delete(game: Game) {
        context.delete(game)
    }

    func moveGames(from source: IndexSet, to destination: Int) {
        var revisedGames = games

        revisedGames.move(fromOffsets: source, toOffset: destination)

        for index in 0..<revisedGames.count {
            revisedGames[index].orderIndex = index
        }
    }
}
