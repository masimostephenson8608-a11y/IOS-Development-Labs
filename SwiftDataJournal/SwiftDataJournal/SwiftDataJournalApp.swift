//
//  SwiftDataJournalApp.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/2/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataJournalApp: App {
    var body: some Scene {
        WindowGroup {
            JournalsView()
        }
        .modelContainer(for: Journal.self)
    }
}
