//
//  ItemCellView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI

struct ItemCellView: View {
    let item: StoreItem
    var onPlayButtonPressed: () -> Void

    var body: some View {
        HStack {
            if let photo = item.artworkUrl100 {
                AsyncImage(url: URL(string: photo))
                    .frame(width: 75, height: 75)
                    .foregroundColor(.gray)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.gray)
            }
            Rectangle()
                .frame(width: 20, height: 1)
                .hidden()
            VStack(alignment: .leading) {
                Text(item.trackName ?? "Not Found")
                    .font(.headline)
                Text(item.artistName ?? "Not Found")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            if let previewUrl = item.previewUrl {
                Button {

                } label: {
                    Image(systemName: "play.circle")
                }
            }
        }
        .padding(.vertical, 8)
    }
}
