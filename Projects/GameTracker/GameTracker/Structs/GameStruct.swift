//
//  GameStruct.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import Foundation
import SwiftData

@Model
class Game: Identifiable {
    @Attribute(.unique) var id = UUID()
    @Attribute var icon: String
    @Attribute var title: String
    @Relationship(deleteRule: .cascade, inverse: \Player.game)
    var players: [Player]
    @Attribute var sortBy: SortBy
    @Attribute var winBy: SortBy
    @Attribute var orderIndex = 0
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
    
    init(id: UUID = UUID(), icon: String, title: String, players: [Player], sortBy: SortBy, winBy: SortBy, orderIndex: Int) {
        self.id = id
        self.icon = icon
        self.title = title
        self.players = players
        self.sortBy = sortBy
        self.winBy = winBy
        self.orderIndex = orderIndex
    }

    enum SortBy: String, Codable {
        case highest, lowest
    }
}
