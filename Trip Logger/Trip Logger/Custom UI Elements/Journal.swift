//
//  Journal.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct Journal: View {
    @Binding var journalEntry: JournalEntry?
    
    var body: some View {
        JournalTopBar(journalEntry: $journalEntry)
            .padding()
        
        if let journalEntry {
            Text(journalEntry.date.formatted(date: .abbreviated, time: .omitted))
                .font(.headline)
            Text(journalEntry.text)
                .font(.body)
            
            ScrollView(.horizontal) {
                HStack {
                    PhotoScrollView(journalEntry: journalEntry)
                    ForEach(journalEntry.photos) {photo in
                        if let uiImage = UIImage(data: photo.data) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 150, height: 150)
                        }
                    }
                    Spacer()
                        .scrollTargetLayout()
                }
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}



struct JournalTopBar: View {
    enum ScreenState {
        case normal, edit, rename
    }
    
    @State var newName = ""
    @Binding var journalEntry: JournalEntry?
    @State var screenState = ScreenState.normal
    @Environment(\.modelContext) var context
    
    var body: some View {
        if screenState == .normal {
            HStack {
                Button("Edit") {
                    // TODO: Add ability to edit journal entries
                    // including adding more JournalEntries by dropping new pins on the map), and edit individual journal entries (change the name, text, and photos)
                    withAnimation(.easeInOut(duration: 0.2)) {
                        screenState = .edit
                    }
                }
                
                Spacer()
                
                Text(journalEntry?.name ?? "Journal")
                    .font(.title)
                
                Spacer()
                
                Button("Dismiss") {
                    journalEntry = nil
                }
            }
        } else if screenState == .edit {
            VStack {
                HStack {
                    Button("Rename") {
                        screenState = .rename
                    }
                    
                    Spacer()
                    
                        Button("Delete") {
                            if let entry  = journalEntry {
                                context.delete(entry)
                                try? context.save()
                                journalEntry = nil
                            }
                        }.tint(.red)
                    
                    Spacer()
                    
                    Button("Cancel") {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            screenState = .normal
                        }
                    }
                }
                Text("If you rename, exit and come back")
                    .font(.custom("", size: 10))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }.transition(.slide)
            
        } else if screenState == .rename {
            if let entry = journalEntry {
                TextField(entry.name, text: $newName)
                    .multilineTextAlignment(.center)
                    .onSubmit {
                        entry.name = newName
                        try? context.save()
                        screenState = .normal
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var trip = Trip.mock()
    
    TripMapScreen(trip: trip, position: .automatic, selectedEntry: trip.journalEntries.first)
}
