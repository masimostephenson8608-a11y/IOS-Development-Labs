//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI

enum Errors: Error {
    case error
}

@Observable
class StoreItemListViewModel {
    var items: [StoreItem] = []

    func fetchItems(searchText: String, mediaTypeIndex: Int) async throws -> [StoreItem] {
        // Map mediaTypeIndex to the API string ("movie", "music", "software", "ebook") and perform network fetch.
        // On completion, update items on main queue.
        // For this template, leave as a stub.
        enum MediaType {
            case music, podcast, ebook, audiobook, software
        }
        
        let baseURLString = "https://itunes.apple.com/search"

        var components = URLComponents(string: baseURLString)

        let queryItems = [
            URLQueryItem(name: "term", value: "The"),
            URLQueryItem(name: "country", value: "US"),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "media", value: "podcast")
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
}

struct StoreItemListView: View {
    @State private var viewModel = StoreItemListViewModel()
    @State private var searchText = ""
    @State private var selectedMediaType = 0

    let mediaTypes = ["Movies", "Music", "Apps", "Books"]

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Media Type", selection: $selectedMediaType) {
                    ForEach(0..<mediaTypes.count, id: \.self) { index in
                        Text(mediaTypes[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .top])

                TextField("Search...", text: $searchText, onCommit: {
                    Task {
                        try await viewModel.fetchItems(searchText: searchText, mediaTypeIndex: selectedMediaType)
                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.horizontal, .bottom])

                List(viewModel.items) { item in
                    ItemCellView(item: item)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iTunes Search")
            .onAppear {
                Task {
                   try await viewModel.fetchItems(searchText: searchText, mediaTypeIndex: selectedMediaType)
                }
            }
        }
    }
}

#Preview {
 StoreItemListView()
}
