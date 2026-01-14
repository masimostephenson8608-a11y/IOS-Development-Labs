//
//  TripMapScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct TripMapScreen: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    var trip: Trip
    
    @State var position: MapCameraPosition
    @State var selectedEntry: JournalEntry?
    @State var rename = false
    @State var newName = ""
    
    
    var body: some View {
        ZStack {
            VStack {
                Map(position: $position, selection: $selectedEntry) {
                    ForEach(trip.journalEntries) { journalEntry in
                        // Creates a pin on the map for every journal entry using its stored name and coordinates
                        Marker("\(journalEntry.name)", coordinate: journalEntry.location.coordinate!)
                            .tag(journalEntry) // Allows the journal entry to be selected and stored in selectedEntry
                    }
                }
                
                if selectedEntry != nil {
                    // Show Journal bar with name, date, notes, and photos
                    Journal(journalEntry: $selectedEntry)
                }
                
            }
            .navigationTitle(trip.name)
            .toolbar {
                // TODO: Add ability to edit trip name, delete trip
                
                if rename == false {
                    Menu {
                        Button("Rename") {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                rename = true
                            }
                        }
                        Button("Delete") {
                            context.delete(trip)
                            try? context.save()
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "gear")
                    }
                } else {
                    Button("Cancel") {
                        rename = false
                        newName = ""
                    }
                }
            }
            if rename == true {
            renameView
                    .transition(.blurReplace)
            }
        }
    }
    
    var renameView: some View {
        ZStack {
            Rectangle()
                .frame(width: 1000, height: 1000)
                .ignoresSafeArea()
                .foregroundStyle(.gray)
                .opacity(0.8)
            
            TextField(trip.name, text: $newName)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if !newName.isEmpty {
                        trip.name = newName
                        newName = ""
                        rename = false
                    }
                }
                .frame(width: 300)
                .padding(45)
        }
    }
}

#Preview {
    NavigationStack {
        TripMapScreen(trip: Trip.mock(), position: .automatic)
    }
}
