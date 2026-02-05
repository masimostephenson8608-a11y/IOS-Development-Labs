//
//  LocationManager.swift
//  ExploringFramework
//
//  Created by Masimo Stephenson on 2/5/26.
//
import SwiftUI
import CoreLocation
import Observation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    var latitude: Double = 0
    var longitude: Double = 0
    var heading: Double = 0
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        
        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            manager.startUpdatingHeading()
        } else {
            print("Location services disabled")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
        
        print("DID UPDATE LOCATIONS")
        print(locations.last!)

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        heading = newHeading.trueHeading
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation()
        }
        
        print("Authorization:", manager.authorizationStatus.rawValue)
    }
}
