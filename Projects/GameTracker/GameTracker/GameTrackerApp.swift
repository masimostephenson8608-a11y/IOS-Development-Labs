//
//  GameTrackerApp.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import SwiftUI

@main
struct GameTrackerApp: App {
    @State var gameInfo = GameInfo(games: [])
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }.environment(gameInfo)
    }
}
