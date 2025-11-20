//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Masimo Stephenson on 11/19/25.
//

import Foundation

enum Errors: Error {
    case error
}

class StoreItemController {
    func fetchItems(searchText: String, mediaType: MediaType) async throws -> [StoreItem] {
        // Map mediaTypeIndex to the API string ("movie", "music", "software", "ebook") and perform network fetch.
        // On completion, update items on main queue.
        // For this template, leave as a stub.
        enum MediaType {
            case music, podcast, ebook, audiobook, software
        }
        
        let baseURLString = "https://itunes.apple.com/search"
        
        var components = URLComponents(string: baseURLString)
        
        let queryItems = [
            URLQueryItem(name: "term", value: searchText),
            URLQueryItem(name: "country", value: "US"),
            URLQueryItem(name: "limit", value: "5"),
            URLQueryItem(name: "media", value: mediaType.rawValue)
            //        URLQueryItem(name: "entity", value: "podcast")
        ]
        
        components?.queryItems = queryItems
        
        
        do {
            guard let url = components?.url else {
                print("Inavlid URL")
                throw Errors.error
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200//,
            //            let string = String(data: data, encoding: .utf8)
            {                                       //MARK: DECODING
                //            data.prettyPrintedJSONString()
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                for count in searchResponse.results {
                    print(count.summary)
                    
                }
                return searchResponse.results
            } else {
                print("Couldn't get http response")
            }
        } catch Errors.error {
            print("Failed to build URL", Errors.error)
        } catch {
            print("Failed The Task Block", error)
        }
        throw Errors.error
    }
    
    func fetchPreview(from url: URL) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let Data = data
        } catch {
            print("Failed to get preview")
        }
    }
}
