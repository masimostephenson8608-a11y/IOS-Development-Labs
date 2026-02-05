//
//  ContentView.swift
//  ExploringFramework
//
//  Created by Masimo Stephenson on 2/3/26.
//

import SwiftUI
import CoreLocation
import Observation
import MapKit

struct ContentView: View {
    @State private var locationManager = LocationManager()
    
    var location: CLLocationCoordinate2D  {
        CLLocationCoordinate2D(latitude: locationManager.latitude,
                               longitude: locationManager.longitude)
    }
    
    @State var cameraPosition: MapCameraPosition = .automatic
    
    var body: some View {
        VStack {
            Text("Latitude: \(locationManager.latitude)")
            Text("Longitude: \(locationManager.longitude)")
            Text("Heading: \(Int(locationManager.heading))°")
            
            Map(initialPosition: cameraPosition) {
                Marker("Me", coordinate: location)
            }
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onChange(of: locationManager.longitude) { oldValue, newValue in
                cameraPosition = .camera(
                    MapCamera(centerCoordinate: location, distance: 1000)
                )
            }
        }
        .padding()
    }
}
