//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI

@Observable
class StoreItemListViewModel {
    var items: [String] = []
    
    var searchText = ""
    var selectedMediaType: MediaType = .music

    func fetchMatchingItems() {
        if !searchText.isEmpty {
            // set up query dictionary
            
            // use the item controller to fetch items
            // if successful, use the main queue to set self.items
            // otherwise, print an error to the console
        }
    }
}

struct StoreItemListView: View {
    @State private var viewModel = StoreItemListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Media Type", selection: $viewModel.selectedMediaType) {
                    ForEach(MediaType.allCases, id: \.self) { mediaType in
                        Text(mediaType.rawValue.capitalized)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .top])

                HStack {
                    TextField("Search...", text: $viewModel.searchText) {
                        // onCommit
                        // When the user hits Return on their keyboard, this closure will trigger
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .submitLabel(.search)
                    .padding([.horizontal, .bottom])
                }
                
                List(viewModel.items, id: \.self) { item in
                    ItemCellView(name: item, artist: item)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iTunes Search")
            .onAppear {
                viewModel.fetchMatchingItems()
            }
        }
    }
}

#Preview {
 StoreItemListView()
}
