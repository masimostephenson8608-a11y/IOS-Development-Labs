//
//  GameStruct.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import Foundation

struct Game: Hashable, Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    var players: [Player]
    var sortBy: SortBy
    var winBy: SortBy
    var winning: Player? {
            var points: [Int] = []
            for player in players {
                points.append(player.points)
            }
            if winBy == .highest {
                if let player = players.first(where: {
                    $0.points == points.max()
                }) {
                    return player
                }
            } else if winBy == .lowest {
                if let player = players.first(where: {
                    $0.points == points.min()
                }) {
                    return player
                }
            }
            return players.first ?? nil
        }

    enum SortBy: String {
        case highest, lowest
    }
}
