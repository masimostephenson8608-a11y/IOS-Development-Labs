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
    private var storeItemController = StoreItemController()
    var previewTask: Task<Void, Never>? = nil
    var previewData: Data? = nil
    
    var searchText = ""
    var selectedMediaType: MediaType = .music

    func fetchMatchingItems() async -> [StoreItem] {
        var results: [StoreItem] = []
            if !searchText.isEmpty {
                do {
                    results = try await storeItemController.fetchItems(searchText: searchText, mediaType: selectedMediaType)
                    return results
                } catch {
                    print("Failed inside viewModel object")
                    return []
                }
            
            // set up query dictionary
            
            // use the item controller to fetch items
            // if successful, use the main queue to set self.items
            // otherwise, print an error to the console
            } else {
                return []
            }
    }
    
    func fetchPreview(item: StoreItem) {
        if let previewTask {
                previewTask.cancel()
            }
        
        self.previewData = nil
        
        guard let string = item.previewUrl, let url = URL(string: string) else {
                    return
                }

            previewTask = Task {
                // Code to fetch the preview data using the URL
                do {
                    let data = try await storeItemController.fetchPreview(from: url)
                    
                    self.previewData = previewData
                } catch {
                    if Task.isCancelled { return }
                    print("Failed to fetch preview: \(error)")
                }
                        
                // Once the task is complete, return the stored task value to nil
                previewTask = nil
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
                        Task {
                            await viewModel.fetchPreview(item: item)
                        }
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
