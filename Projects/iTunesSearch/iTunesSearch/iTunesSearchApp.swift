//
//  iTunesSearchApp.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI
import Foundation

import CoreHaptics

struct ItunesSearchView: View {
    
    
    var body: some View {
        Text("Searching Itunes...")
            .onAppear() {
                Task {
//                    await buildURL()
                }
            }
    }
//    func buildURL() async {
//        let baseURLString = "https://itunes.apple.com/search"
//        
//        var components = URLComponents(string: baseURLString)
//        
//        let queryItems = [
//            URLQueryItem(name: "term", value: "Jack Johnson"),
//            URLQueryItem(name: "limit", value: "10")
//        ]
//        
//        components?.queryItems = queryItems
//        
//        Task {
//            do {
//                guard let url = components?.url else {
//                    print("Inavlid URL")
//                    return
//                }
//                let (data, response) = try await URLSession.shared.data(from: url)
//                
//                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
//                   let string = String(data: data, encoding: .utf8) {
//                    print(string)
//                }
//            } catch {
//                print("Failed The Task Block")
//            }
//        }
//    }
}


@main
struct iTunesSearchApp: App {
    var body: some Scene {
        WindowGroup {
            StoreItemListView()
        }
    }
}
