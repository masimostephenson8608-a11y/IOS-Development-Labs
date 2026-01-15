//
//  PlacePinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct PlacePinScreen: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Binding var activateDismiss: Bool
    @State var trip: Trip
    @State var pinPlaced = false
    @State var save = false
    let tripName: String

    @State var index: Int? = nil
    
    init (tripName: String, activateDismiss: Binding<Bool>) {
        self.tripName = tripName
        _activateDismiss = activateDismiss
        trip = Trip(name: tripName)
        index = nil
    }
    
    init (existingTrip: Trip, activateDismiss: Binding<Bool>) {
        _activateDismiss = activateDismiss
        index = nil
        self.tripName = ""
        trip = existingTrip
    }

    var body: some View {
        NavigationStack {
            VStack {
                MapReader { reader in // Allows conversion of a touch gesture into coordinates
                    Map {
                        // TODO: Display the pin the user placed
                        ForEach(trip.journalEntries) { entry in
                            if let mapItem = entry.location.mapItem {
                                Marker(item: mapItem)
                        }
                    }
                        
                    }
                    .simultaneousGesture(SpatialTapGesture()
                        .onEnded { event in
                            let location = event.location
                            placePin(reader: reader, location: location)
                        }
                    )
                }
            }
            .navigationTitle("Place First Pin")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink("Next") {
                    if index != nil {
                        SetUpPinScreen(entry: $trip.journalEntries[index!], save: $save, activateDismiss: $activateDismiss)
                    }
                }
            }
            .onChange(of: save) {
                saveContext()
            }
            .onChange(of: trip.journalEntries) {
                if let newIndex = trip.journalEntries.firstIndex(where: { $0.name.isEmpty == true && $0.text.isEmpty == true }) {
                    index = newIndex
                }
            }
            .onChange(of: activateDismiss) {
                if activateDismiss == true {
                    dismiss()
                }
            }
        }
    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        if let coordinate = reader.convert(location, from: .local) {
            if pinPlaced == false {
                let newEntry = JournalEntry(name: "", location: Location(latitude: coordinate.latitude, longitude: coordinate.longitude) ,photos: [], date: .now, text: "")
                trip.journalEntries.append(newEntry)
                pinPlaced = true
            }
        }
    }
    
    func saveContext() {
        if save == true {
            context.insert(trip)
            save = false
        }
    }
}

#Preview {
//    PlacePinScreen(tripName: "HI")
//        .modelContainer(ModelContainer.preview)
}
