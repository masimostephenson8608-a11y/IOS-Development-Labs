//
//  EntryView.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/2/25.
//

import SwiftUI
import SwiftData

struct EntryView: View {
    var entry: JournalEntry
    @State var newName: String = ""
    @State var newText: String = ""
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextField(text: $newName) {
                Text("\(entry.name)")
                    .foregroundStyle(.black)
            }
                .font(.largeTitle)
                .padding(25)
            Divider()
            let displayDate = entry.createdAt.formatted(date: .long, time: .shortened)
            Text("Created at: \(displayDate)")
                .font(.caption)
                .padding(10)
            Divider()
            TextField(text: $newText) {
                Text("\(entry.text)")
                    .foregroundStyle(.black)
            }
                .font(.title)
                .lineLimit(10)
                .fixedSize(horizontal: false, vertical: true)
                .padding(25)
            Spacer()
            
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            saveNewEntry()
                            dismiss()
                        }
                    }
                }
        }.padding(.horizontal, 25)
    }
    func saveNewEntry() {
        if !newName.isEmpty {
            entry.name = newName
        }
        if !newText.isEmpty {
            entry.text = newText
        }
        do {
            try context.save()
        } catch {
            print("Failed to save the context within the Entry View")
        }
    }

}
