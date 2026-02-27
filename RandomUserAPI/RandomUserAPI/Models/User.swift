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
    
    
    static let mockUsers: [User] = [

        User(
            gender: "female",
            name: Name(
                title: "Ms",
                first: "Avery",
                last: "Coleman"
            ),
            location: Location(
                street: Street(
                    number: 742,
                    name: "Maple Avenue"
                ),
                city: "Denver",
                state: "Colorado",
                country: "United States",
                postcode: 80203,
                coordinates: Coordinate(
                    latitude: "39.7312",
                    longitude: "-104.9820"
                ),
                timezone: TimeZone(
                    offset: "-07:00",
                    description: "Mountain Time (US & Canada)"
                )
            ),
            email: "avery.coleman@example.com",
            login: Login(
                uuid: "c1a9f0e2-6b7a-4d3c-9e1a-1f0d2b3c4a5e",
                username: "averyc",
                password: "p@ssW0rd!",
                salt: "abc123",
                md5: "5f4dcc3b5aa765d61d8327deb882cf99",
                sha1: "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8",
                sha256: "ef92b778bafe771e89245b89ecbc1d1a0e2f9a8f6e7c8d9b0a1b2c3d4e5f678"
            ),
            dob: DateOfBirth(
                date: "1990-04-12T09:15:30Z",
                age: 35
            ),
            registered: RegistrationDate(
                date: "2015-06-20T12:45:00Z",
                age: 10
            ),
            phone: "(303)-555-0142",
            cell: "(720)-555-0198",
            id: Identification(
                name: "SSN",
                value: "123-45-6789"
            ),
            picture: Picture(
                large: "https://randomuser.me/api/portraits/women/65.jpg",
                medium: "https://randomuser.me/api/portraits/med/women/65.jpg",
                thumbnail: "https://randomuser.me/api/portraits/thumb/women/65.jpg"
            ),
            nat: "US"
        ),

        User(
            gender: "male",
            name: Name(
                title: "Mr",
                first: "Liam",
                last: "Nguyen"
            ),
            location: Location(
                street: Street(
                    number: 1289,
                    name: "Oak Street"
                ),
                city: "Seattle",
                state: "Washington",
                country: "United States",
                postcode: 98101,
                coordinates: Coordinate(
                    latitude: "47.6101",
                    longitude: "-122.3344"
                ),
                timezone: TimeZone(
                    offset: "-08:00",
                    description: "Pacific Time (US & Canada)"
                )
            ),
            email: "liam.nguyen@example.com",
            login: Login(
                uuid: "a8b7c6d5-e4f3-4a21-9c8d-7e6f5a4b3c2d",
                username: "liamn",
                password: "Secure*123",
                salt: "def456",
                md5: "098f6bcd4621d373cade4e832627b4f6",
                sha1: "a94a8fe5ccb19ba61c4c0873d391e987982fbbd3",
                sha256: "5e884898da28047151d0e56f8dc6292773603d0d6aabbddf1e6f9d8c6f7a1b2c"
            ),
            dob: DateOfBirth(
                date: "1985-09-03T14:22:10Z",
                age: 40
            ),
            registered: RegistrationDate(
                date: "2012-11-10T08:30:00Z",
                age: 13
            ),
            phone: "(206)-555-0111",
            cell: "(425)-555-0177",
            id: Identification(
                name: "SSN",
                value: "987-65-4321"
            ),
            picture: Picture(
                large: "https://randomuser.me/api/portraits/men/32.jpg",
                medium: "https://randomuser.me/api/portraits/med/men/32.jpg",
                thumbnail: "https://randomuser.me/api/portraits/thumb/men/32.jpg"
            ),
            nat: "US"
        ),

        User(
            gender: "female",
            name: Name(
                title: "Mrs",
                first: "Isabella",
                last: "Rossi"
            ),
            location: Location(
                street: Street(
                    number: 56,
                    name: "Via Roma"
                ),
                city: "Florence",
                state: "Tuscany",
                country: "Italy",
                postcode: 50122,
                coordinates: Coordinate(
                    latitude: "43.7696",
                    longitude: "11.2558"
                ),
                timezone: TimeZone(
                    offset: "+01:00",
                    description: "Central European Time"
                )
            ),
            email: "isabella.rossi@example.com",
            login: Login(
                uuid: "11223344-5566-7788-99aa-bbccddeeff00",
                username: "isarossi",
                password: "R0ssi!2024",
                salt: "ghi789",
                md5: "ad0234829205b9033196ba818f7a872b",
                sha1: "2fd4e1c67a2d28fced849ee1bb76e7391b93eb12",
                sha256: "6dcd4ce23d88e2ee9568ba546c007c63d9131c1b4f4d7a8e9c0b1a2d3e4f5a6b"
            ),
            dob: DateOfBirth(
                date: "1995-01-25T07:10:45Z",
                age: 31
            ),
            registered: RegistrationDate(
                date: "2018-03-14T10:05:00Z",
                age: 7
            ),
            phone: "+39-055-555-1234",
            cell: "+39-347-555-5678",
            id: Identification(
                name: "CF",
                value: "RSSISB95A65F205X"
            ),
            picture: Picture(
                large: "https://randomuser.me/api/portraits/women/44.jpg",
                medium: "https://randomuser.me/api/portraits/med/women/44.jpg",
                thumbnail: "https://randomuser.me/api/portraits/thumb/women/44.jpg"
            ),
            nat: "IT"
        ),

        User(
            gender: "male",
            name: Name(
                title: "Mr",
                first: "Noah",
                last: "Patel"
            ),
            location: Location(
                street: Street(
                    number: 908,
                    name: "King Street"
                ),
                city: "Toronto",
                state: "Ontario",
                country: "Canada",
                postcode: 10001,
                coordinates: Coordinate(
                    latitude: "43.6532",
                    longitude: "-79.3832"
                ),
                timezone: TimeZone(
                    offset: "-05:00",
                    description: "Eastern Time (US & Canada)"
                )
            ),
            email: "noah.patel@example.com",
            login: Login(
                uuid: "ffeeddcc-bbaa-9988-7766-554433221100",
                username: "noahp",
                password: "P@tel2025",
                salt: "jkl012",
                md5: "8ad8757baa8564dc136c1e07507f4a98",
                sha1: "3f786850e387550fdab836ed7e6dc881de23001b",
                sha256: "4e07408562bedb8b60ce05c1decfe3ad16b7223091e1a8f7a9c0b2d3e4f5a6b7"
            ),
            dob: DateOfBirth(
                date: "1992-12-08T16:40:00Z",
                age: 33
            ),
            registered: RegistrationDate(
                date: "2016-09-05T09:20:00Z",
                age: 9
            ),
            phone: "(416)-555-0133",
            cell: "(647)-555-0188",
            id: Identification(
                name: "SIN",
                value: "123-456-789"
            ),
            picture: Picture(
                large: "https://randomuser.me/api/portraits/men/75.jpg",
                medium: "https://randomuser.me/api/portraits/med/men/75.jpg",
                thumbnail: "https://randomuser.me/api/portraits/thumb/men/75.jpg"
            ),
            nat: "CA"
        ),
        
        User(
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
    ]
}
