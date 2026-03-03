//
//  DocAssistApp.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/20/26.
//

import SwiftUI
import SwiftData

enum DocumentTypes: String {
    case pdf
}

@main
struct DocAssistApp: App {
    let container: ModelContainer
    @State var storeCategory = StoreCategory()
    
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
            TabView {
                Tab("Home", systemImage: "text.rectangle") {
                    HomeView()
                }
                
                Tab("Files", systemImage: "document.on.document") {
                    FolderDisplayView()
                }
            }
        }
        .modelContainer(container)
        .environment(storeCategory)
    }
}
