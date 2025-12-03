//
//  JournalsView.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/3/25.
//

import SwiftUI
import SwiftData

struct JournalsView: View {
    @Query(sort: \Journal.createdAt, order: .reverse)
    private var journals: [Journal]
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            List(journals, id: \.id) { journal in
                NavigationLink {
                    JournalEntriesView(journal: journal)
                } label: {
                    VStack {
                        Text("\(journal.name)")
                            .font(.title.bold())
                        Text(journal.createdAt, format: Date.FormatStyle(date: .numeric, time: .shortened))
                            .font(.footnote)
                    }
                }.swipeActions(edge: .trailing) {
                    Button("Delete") {
                        delete(journal: journal)
                    }.tint(.red)
                }
            }
            .navigationTitle("Journals")
            .navigationBarTitleDisplayMode(.large)
            
            
            .toolbar {
                ToolbarItem() {
                    NavigationLink("Add") {
                        AddJournalView()
                            .interactiveDismissDisabled()
                    }
                }
            }
        }
    }
    
    
    func delete(journal: Journal) {
        context.delete(journal)
    }
}

#Preview {
    JournalsView()
}
