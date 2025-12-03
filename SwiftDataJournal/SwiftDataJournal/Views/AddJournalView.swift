//
//  AddJournalView.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/3/25.
//

import SwiftUI
import SwiftData

struct AddJournalView: View {
    @State var journalName: String = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            List() {
                Section("Journal Name") {
                    TextField("", text: $journalName)
                        .padding(.vertical, 10)
                        .font(.title)
                }
            
            }
            .lineSpacing(100)
            
            .navigationTitle("New Journal")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Back") {
                        journalName = ""
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveNewJournal()
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    func saveNewJournal() {
            context.insert(Journal(name: journalName, entries: []))
            do {
                try context.save()
            } catch {
                print("Couldn't Save Context, message coming from the SaveNewEntry function")
            }
            journalName = ""
    }

}


#Preview {
    AddJournalView()
}
