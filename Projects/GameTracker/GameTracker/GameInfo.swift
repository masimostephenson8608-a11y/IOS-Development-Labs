//
//  GameInfo.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import Foundation
import Observation

@Observable
class GameInfo {
    var games: [Game] = []
    
    init(games: [Game]) {
        self.games = games
    }
}
