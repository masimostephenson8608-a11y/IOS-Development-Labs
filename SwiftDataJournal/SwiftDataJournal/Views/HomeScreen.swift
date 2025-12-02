//
//  ContentView.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/2/25.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    @Query(sort: \JournalEntry.createdAt, order: .reverse)
    private var journalEntries: [JournalEntry]
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            List(journalEntries, id: \.id) { entry in
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
            .navigationTitle("Journal Entries")
            .navigationBarTitleDisplayMode(.large)
            
            
            .toolbar {
                ToolbarItem() {
                    NavigationLink("Add") {
                        AddEntryView()
                    }
                }
            }
        }
    }
    
        
    func delete(entry: JournalEntry) {
        context.delete(entry)
    }
}
