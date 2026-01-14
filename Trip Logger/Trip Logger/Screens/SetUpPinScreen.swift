//
//  SetUpPinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct SetUpPinScreen: View {
    @Environment(\.dismiss) var dismiss
    @Binding var entry: JournalEntry
    @Binding var save: Bool
    @Binding var activateDismiss: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type Name Here", text: $entry.name).multilineTextAlignment(.center)
                TextField("Type Description Here", text: $entry.text).multilineTextAlignment(.center)
                ScrollView(.horizontal) {
                    HStack {
                        PhotoScrollView(journalEntry: entry)
                        ForEach(entry.photos) {photo in
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
            .toolbar {
                Button("Save") {
                    save = true
                    activateDismiss = true
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var trip = Trip.mock()
    @Previewable @State var save = false
    @Previewable @State var sure = false
    SetUpPinScreen(entry: $trip.journalEntries[0], save: $save, activateDismiss: $sure)
}
