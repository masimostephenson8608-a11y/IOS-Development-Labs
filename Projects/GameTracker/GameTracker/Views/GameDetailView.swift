//
//  GameDetailView.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/11/25.
//

import SwiftUI
import SwiftData

struct GameDetailView: View {
    @Bindable var game: Game
    @State var sortBy: Game.SortBy = .highest
    @State var winBy: Game.SortBy = .highest
    @State var playerName = ""
    @State var playerColor = ""
    @Environment(\.modelContext) var context
    
            
    var playersSorted: [Player] {
        if game.sortBy == .highest {
            return game.players.sorted(by: { $0.points > $1.points })
        } else if game.sortBy == .lowest {
            return game.players.sorted(by: { $0.points < $1.points })
        }
        return game.players
    }
    var body: some View {
        VStack {

            
            Text("Sorted by: \(game.sortBy.rawValue)")
                .padding(.top)
            Picker("Sorted by:", selection: $game.sortBy) {
                Text("Highest")
                    .tag(Game.SortBy.highest)
                Text("Lowest")
                    .tag(Game.SortBy.lowest)
            }.pickerStyle(.segmented)
                .frame(width: 150)
            
            
            Text("Player wins by: \(game.winBy.rawValue)")
            Picker("Who wins:", selection: $game.winBy) {
                Text("Highest")
                    .tag(Game.SortBy.highest)
                Text("Lowest")
                    .tag(Game.SortBy.lowest)
            }.pickerStyle(.segmented)
                .frame(width: 150)
            
            List(playersSorted, id: \.id) { player in
                HStack {
                    Image(systemName: "person.fill")
                        .padding(10)
                        .foregroundStyle(getColor(color: player.color))
                    Text(player.name)
                        .padding(10)
                    
                    Stepper("Points: \(player.points)", onIncrement: {
                        player.points += 1
                    }, onDecrement: {
                        if player.points > 0 {
                            player.points -= 1
                        }
                    })
                }.swipeActions {
                    Button("Delete") {
                        deletePlayer(player: player)
                    }
                    .tint(.red)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Spacer()
                Image(systemName: "person.fill")
                    .foregroundStyle(getColor(color: playerColor))
                TextField("Player Name", text: $playerName)
                    .frame(maxWidth: 150)
                Picker("Color", selection: $playerColor) {
                    Text("Red")
                        .tag("red")
                    Text("Green")
                        .tag("green")
                    Text("Black")
                        .tag("black")
                }
                Spacer()
            }
            
            Button("Save Player") {
                savePlayer()
            }

            Spacer()
        }
        .padding()
        .navigationTitle(game.title)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
    
    func getColor(color: String) -> Color {
        switch color {
        case "red":
            return Color.red
        case "green":
            return Color.green
        case "black":
            return Color.black
        default:
            return Color.black
        }
    }
    
    func savePlayer() {
        if !playerName.isEmpty {
            game.players.append(Player(name: playerName, color: playerColor, points: 0))
        }
        playerName = ""
        playerColor = ""
    }
    
    func deletePlayer(player: Player) {
        let index = game.players.firstIndex(where: { $0.id == player.id })
        if let index = index {
            game.players.remove(at: index)
        }
    }
}
