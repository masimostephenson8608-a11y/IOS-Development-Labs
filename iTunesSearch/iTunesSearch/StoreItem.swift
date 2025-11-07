//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//
import Foundation
import SwiftUI

// Example model for a table item
struct StoreItem: Identifiable {
    let artworkUrl60: String?
    let collectionPrice: Double?
    let wrapperType: Wrappertype?
    let country: String?
    let isStreamable: Bool?
    let releaseDate: Date?
    let artistId: Int?
    let collectionViewUrl: String?
    let kind: Kind?
    let trackExplicitness: Explicitness?
    let currency: String?
    let artistName: String?
    let artistViewUrl: String?
    let artworkUrl30: String?
    let trackViewUrl: String?
    let discCount: Int?
    let collectionCensoredName: String?
    let collectionId: Int?
    let trackCensoredName: String?
    let previewUrl: String?
    let trackTimeMillis: Int?
    let trackName: String?
    let trackPrice: Double?
    let collectionName: String?
    let artworkUrl100: String?
    let trackCount: Int?
    let trackId: Int?
    let discNumber: Int?
    let collectionExplicitness: Explicitness?
    let trackNumber: Int?
    let primaryGenreName: String?
    let copyright: String?
    let description: String?
    let averageUserRating: Double?
    let userRatingCount: Int?
    let artistIds: [Int]?
    let networkUrl100: String?
    let genres: [String]?
    let formattedPrice: String?
    let price: Double?
    let genreIds: [String]?
    let contentAdvisoryRating: String?
    let feedUrl: String?
    let collectionHdPrice: Double?
    let artworkUrl600: String?
    let sellerUrl: String?
    let artworkUrl512: String?
    let ipadScreenshotUrls: [String]?
    let fileSizeBytes: String?
    let languageCodesISO2A: [String]?
    let supportedDevices: [String]?

    var summary: String {
        var lines: [String] = [" "]
        if let artist = artistName { lines.append("Artist Name: \(artist)") }
        if let track = trackName { lines.append("Track Name: \(track)") }
        if let type = kind { lines.append("Kind: \(type)") }
        if let price = collectionPrice {
            lines.append("Collection Price: \(price)")
        }
        if let entertainmentType = wrapperType {
            lines.append("Entertainment Type: \(entertainmentType)")
        }
        if let location = country { lines.append("Country: \(location)") }
        if let streamable = isStreamable {
            lines.append("Streamable: \(streamable)")
        }
        if let date = releaseDate {
            lines.append(
                "Release Date: \(displayDateFormatter.string(from: date))"
            )
        }
        if let explicit = trackExplicitness {
            lines.append("Track Explicit: \(explicit)")
        }
        if let explicit = collectionExplicitness {
            lines.append("Collection Explicit: \(explicit)")
        }

        //            artistId
        //            currency
        //            discCount
        //            collectionCensoredName
        //            collectionId
        //            trackCensoredName
        //            previewUrl
        //            trackTimeMillis
        //            trackPrice
        //            artworkUrl60
        //            collectionViewUrl
        //            artistViewUrl
        //            artworkUrl30
        //            trackViewUrl
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

    //    let id = UUID()
    //    let name: String
    //    let artist: String
    //    let artworkImage: UIImage?
}
