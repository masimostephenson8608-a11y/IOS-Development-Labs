//
//  NewTripView.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct NewTripScreen: View {
    @Environment(\.dismiss) var dismiss
    @State var activateDismiss = false
    @State var tripName = ""
    @State var showingPlacePin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("First, give a name to your trip.")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Type Here", text: $tripName)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
            .toolbar {
                Button("Next") {
                    showingPlacePin = true
                }.disabled(tripName.isEmpty ? true : false)
            }
            .sheet(isPresented: $showingPlacePin) {
                PlacePinScreen(tripName: tripName, activateDismiss: $activateDismiss)
            }
        }
        .onChange(of: activateDismiss) {
            if activateDismiss == true {
                dismiss()
            }
        }
    }
}

#Preview {
    NewTripScreen()
        .modelContainer(ModelContainer.preview)
}
