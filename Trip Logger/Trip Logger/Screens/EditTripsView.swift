//
//  EditTripsView.swift
//  Trip Logger
//
//  Created by Masimo Stephenson on 1/14/26.
//

import SwiftUI

struct EditTripsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Binding var trips: [Trip]
    
    var body: some View {
        NavigationStack {
            List(trips) {trip in
                Text(trip.name)
                .swipeActions {
                    Button("Delete") {
                        deleteTrip(trip: trip)
                    }.tint(.red)
                }
            }
        }
    }
    
    func deleteTrip(trip: Trip) {
        context.delete(trip)
        try? context.save()
    }
}

#Preview {
    @Previewable @State var trips = [Trip.mock()]
    EditTripsView(trips: $trips)
}
