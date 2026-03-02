//
//  DocAssistApp.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/20/26.
//

import SwiftUI
import SwiftData

@main
struct DocAssistApp: App {
    let container: ModelContainer
    
    init() {
        do {
            let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "DocAssist.sqlite"))
            container = try ModelContainer(for: Document.self, configurations: config)
        } catch {
            fatalError("Could not create modelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}

enum DocumentTypes: String {
    case pdf
}
