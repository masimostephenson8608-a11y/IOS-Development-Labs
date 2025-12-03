//
//  ContentView.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/2/25.
//

import SwiftUI
import SwiftData

struct JournalEntriesView: View {
    var journal: Journal
    var journalEntries: [JournalEntry] {
        return journal.entries
    }
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            if journalEntries.isEmpty {
                Text("NO JOURNAL ENTRIES")
            } else {
                List(journalEntries.sorted { $0.createdAt < $1.createdAt }, id: \.id) { entry in
                    NavigationLink {
                        EntryView(entry: entry)
                    } label: {
                        VStack {
                            Text("\(entry.name)")
                                .font(.title.bold())
                            Text(entry.createdAt, format: Date.FormatStyle(date: .numeric, time: .shortened))
                                .font(.footnote)
                        }
                    }.swipeActions(edge: .trailing) {
                        Button("Delete") {
                            delete(entry: entry)
                        }.tint(.red)
                    }
                }
            }
            Rectangle().frame(width: 1, height: 1).hidden()
            .navigationTitle("Journal Entries")
            .navigationBarTitleDisplayMode(.large)
            
            
            .toolbar {
                ToolbarItem() {
                    NavigationLink("Add") {
                        AddEntryView(journal: journal)
                            .interactiveDismissDisabled()
                    }
                }
            }
        }
    }
    
        
    func delete(entry: JournalEntry) {
        context.delete(entry)
    }
}
