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

    let nameSpace: Namespace.ID

    @State private var selectedGame: Game? = nil
    @State private var showingDetail = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(games, id: \.id) { game in
                    Button {
                        selectedGame = game
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            selectedGame = game
                            showingDetail = true
                        }
                    } label: {
                        HStack {
                            Image(systemName: game.icon)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .matchedGeometryEffect(
                                    id: game.id,
                                    in: nameSpace
                                )
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
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .swipeActions {
                        Button("Delete") {
                            delete(game: game)
                        }.tint(.red)
                    }
                }
                .onMove(perform: moveGames)
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
            }
        }
        .ignoresSafeArea()
        .fullScreenCover(item: $selectedGame) { game in
            GameDetailView(
                    game: game,
                    nameSpace: nameSpace,
                    showingDetail: Binding(
                        get: { selectedGame != nil },
                        set: { if !$0 { selectedGame = nil } }
                    )
                )
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
