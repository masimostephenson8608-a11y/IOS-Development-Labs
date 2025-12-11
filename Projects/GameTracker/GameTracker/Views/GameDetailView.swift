//
//  GameDetailView.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/11/25.
//

import SwiftUI

struct GameDetailView: View {
    @Bindable var game: Game
    @State var sortBy: Game.SortBy = .highest
    @State var winBy: Game.SortBy = .highest
        
    var playersSorted: [Player] {
        if game.sortBy == .highest {
            return game.players.sorted(by: { $0.points > $1.points })
        } else if game.sortBy == .lowest {
            return game.players.sorted(by: { $0.points < $1.points })
        }
        return game.players
    }
    var body: some View {
        HStack {
            Image(systemName: game.icon)
                .resizable()
                .frame(width: 50, height: 50)
            Text(game.title)
        }
        Text("Sorted by: \(game.sortBy.rawValue)")
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
        
        List(playersSorted, id: \.id) {player in
            HStack {
                Image(systemName: "person.fill")
                    .padding(10)
                Text(player.name)
                    .padding(10)

                Stepper("Points: \(player.points)", onIncrement: {
                    player.points += 1
                }, onDecrement: {
                    if player.points > 0 {
                        player.points -= 1
                    }
                })
            }
        }
    }
    func getPoints(player: Player) -> Int {
        player.points
    }
}
