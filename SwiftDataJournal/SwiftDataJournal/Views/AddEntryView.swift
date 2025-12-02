//
//  AddEntryView.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/2/25.
//

import SwiftUI
import SwiftData

struct AddEntryView: View {
    @State var entryName: String = ""
    @State var entryText: String = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            /*
             id: String
             text: String
             createdAt: Date
             */
            List() {
                Section("Entry Name") {
                    TextField("", text: $entryName)
                        .padding(.vertical, 10)
                        .font(.title)
                }
                
                Section("Entry Text") {
                    TextField("", text: $entryText)
                        .padding(.vertical, 20)
                        .font(.title2)
                }
            }
            .lineSpacing(100)
            
            .navigationTitle("New Entry")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Back") {
                        entryName = ""
                        entryText = ""
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveNewEntry()
                        dismiss()
                    }
                }
            }
        }.interactiveDismissDisabled(true)
    }
    
    func saveNewEntry() {
            context.insert(JournalEntry(name: entryName, text: entryText))
            do {
                try context.save()
            } catch {
                print("Couldn't Save Context, message coming from the SaveNewEntry function")
            }
            entryName = ""
            entryText = ""
    }

}
