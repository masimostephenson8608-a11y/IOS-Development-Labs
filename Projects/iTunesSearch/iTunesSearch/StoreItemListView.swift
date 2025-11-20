//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI


@Observable
class StoreItemListViewModel {
    var items: [StoreItem] = []


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
