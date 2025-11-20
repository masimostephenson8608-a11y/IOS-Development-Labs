//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Masimo Stephenson on 11/19/25.
//

import Foundation
import SwiftUI

struct SearchResponse: Codable {
    let resultCount: Int
    let results: [StoreItem]
}

// Example model for a table item
struct StoreItem: Identifiable, Codable {
    var id = UUID()
    let artworkUrl100: String?
    let artistName: String?
    let trackName: String?
    let collectionName: String?
    let kind: Kind?
    let wrapperType: Wrappertype?
    let releaseDate: Date?
    let country: String?
    let primaryGenreName: String?
    let trackPrice: Double?
    let collectionPrice: Double?
    let currency: String?
    let previewUrl: String?
    let trackExplicitness: Explicitness?
    let collectionExplicitness: Explicitness?
    let description: String? // sometimes "description", sometimes "longDescription" → needs custom decoding
    let artworkUrl600: String? // for podcasts
    let feedUrl: String? // for podcasts
    let isStreamable: Bool?
    let trackTimeMillis: Int?
    let copyright: String?
    
    var summary: String {
        var lines: [String] = []
        if let name = trackName { lines.append("Track Name: \(name)") }
        if let type = wrapperType { lines.append("Type: \(type)") }
        if let kind = kind { lines.append("Kind: \(kind)")}
        if let releaseDate = releaseDate { lines.append("Release Date: \(releaseDate)")}
        if let explicit = trackExplicitness { lines.append("Explicit: \(explicit)") }
        if let description = description { lines.append("Description: \(description)")}
        return lines.joined(separator: "\n")
    }

    enum Wrappertype: String, Codable {
        case track
        case audiobook
        case podcast
        case software
        case unkown
    }

    enum Explicitness: String, Codable {
        case explicit
        case cleaned
        case notExplicit
        case unknown
    }

    enum Kind: String, Codable {
        case song
        case musicVideo = "music-video"
        case ebook
        case podcast
        case software
        case unkown
    }


    enum CodingKeys: String, CodingKey {
            case artworkUrl100
            case artistName
            case trackName
            case collectionName
            case kind
            case wrapperType
            case releaseDate
            case country
            case primaryGenreName
            case trackPrice
            case collectionPrice
            case currency
            case previewUrl
            case trackExplicitness
            case collectionExplicitness
            case description
            case artworkUrl600
            case feedUrl
            case isStreamable
            case trackTimeMillis
            case copyright
        }

        // Additional key to catch "longDescription"
        enum AdditionalKeys: String, CodingKey {
            case longDescription
        }

        init(from decoder: Decoder) throws {
            // Get main container
            let container = try decoder.container(keyedBy: CodingKeys.self)

            artworkUrl100 = try? container.decode(String.self, forKey: .artworkUrl100)
            artistName = try? container.decode(String.self, forKey: .artistName)
            trackName = try? container.decode(String.self, forKey: .trackName)
            collectionName = try? container.decode(String.self, forKey: .collectionName)
            kind = try? container.decode(Kind.self, forKey: .kind)
            wrapperType = try? container.decode(Wrappertype.self, forKey: .wrapperType)
            releaseDate = try? container.decode(Date.self, forKey: .releaseDate)
            country = try? container.decode(String.self, forKey: .country)
            primaryGenreName = try? container.decode(String.self, forKey: .primaryGenreName)
            trackPrice = try? container.decode(Double.self, forKey: .trackPrice)
            collectionPrice = try? container.decode(Double.self, forKey: .collectionPrice)
            currency = try? container.decode(String.self, forKey: .currency)
            previewUrl = try? container.decode(String.self, forKey: .previewUrl)
            trackExplicitness = try? container.decode(Explicitness.self, forKey: .trackExplicitness)
            collectionExplicitness = try? container.decode(Explicitness.self, forKey: .collectionExplicitness)
            artworkUrl600 = try? container.decode(String.self, forKey: .artworkUrl600)
            feedUrl = try? container.decode(String.self, forKey: .feedUrl)
            isStreamable = try? container.decode(Bool.self, forKey: .isStreamable)
            trackTimeMillis = try? container.decode(Int.self, forKey: .trackTimeMillis)
            copyright = try? container.decode(String.self, forKey: .copyright)
            description = try? container.decode(String?.self, forKey: .description)
                ?? (try? decoder.container(keyedBy: AdditionalKeys.self)
                    .decode(String.self, forKey: .longDescription))
        }
}


