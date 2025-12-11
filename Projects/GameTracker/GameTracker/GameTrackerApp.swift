//
//  GameTrackerApp.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import SwiftUI
import SwiftData

@main
struct GameTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }.modelContainer(for: Game.self)
    }
}
