//
//  Location.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//
import Foundation

struct Location: Codable {
    var street: Street
    var city: String
    var state: String
    var country: String
    var postcode: Int
    var coordinates: Coordinate
    var timezone: TimeZone
}

struct Street: Codable {
    var number: Int
    var name: String
}

struct Coordinate: Codable {
    var latitude: String
    var longitude: String
}

struct TimeZone: Codable {
    var offset: String
    var description: String
}
