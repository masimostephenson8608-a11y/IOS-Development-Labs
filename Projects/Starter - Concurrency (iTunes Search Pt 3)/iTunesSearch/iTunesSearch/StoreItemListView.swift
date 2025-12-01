//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI


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
                        Task {
                            viewModel.items = await viewModel.fetchMatchingItems()
                        }
                        // When the user hits Return on their keyboard, this closure will trigger
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .submitLabel(.search)
                    .padding([.horizontal, .bottom])
                }
                
                List(viewModel.items) { item in
                    ItemCellView(item: item) {
                        viewModel.fetchPreview(item: item)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("iTunes Search")
        }
    }
}

#Preview {
 StoreItemListView()
}
