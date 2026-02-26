//
//  User.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//
import Foundation

struct User: Codable, Identifiable {
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var login: Login
    var dob: DateOfBirth
    var registered: RegistrationDate
    var phone: String
    var cell: String
    var id: Identification
    var picture: Picture
    var nat: String
    
    static let mock = User(
        gender: "male",
        name: Name(
            title: "Mr",
            first: "Masimo",
            last: "Stephenson"
        ),
        location: Location(
            street: Street(
                number: 742,
                name: "Evergreen Terrace"
            ),
            city: "Lehi",
            state: "Utah",
            country: "United States",
            postcode: 84043,
            coordinates: Coordinate(
                latitude: "40.3916",
                longitude: "-111.8508"
            ),
            timezone: TimeZone(
                offset: "-7:00",
                description: "Mountain Time (US & Canada)"
            )
        ),
        email: "masimo@example.com",
        login: Login(
            uuid: UUID().uuidString,
            username: "masimo_dev",
            password: "SecurePass123",
            salt: "abc123salt",
            md5: "mockmd5hash",
            sha1: "mocksha1hash",
            sha256: "mocksha256hash"
        ),
        dob: DateOfBirth(
            date: "2000-05-12T00:00:00Z",
            age: 25
        ),
        registered: RegistrationDate(
            date: "2020-01-15T00:00:00Z",
            age: 5
        ),
        phone: "(801) 555-1234",
        cell: "(801) 555-5678",
        id: Identification(
            name: "SSN",
            value: "123-45-6789"
        ),
        picture: Picture(
            large: "https://randomuser.me/api/portraits/men/1.jpg",
            medium: "https://randomuser.me/api/portraits/med/men/1.jpg",
            thumbnail: "https://randomuser.me/api/portraits/thumb/men/1.jpg"
        ),
        nat: "US"
    )
}
