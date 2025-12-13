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
    @Namespace var nameSpace
    var body: some Scene {
        WindowGroup {
            HomeScreen(nameSpace: nameSpace)
        }.modelContainer(for: Game.self)
    }
}
