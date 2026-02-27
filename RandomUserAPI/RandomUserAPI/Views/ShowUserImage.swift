//
//  ShowImageView.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/26/26.
//

import SwiftUI

struct ShowUserImage: View {
    let user: User
    var body: some View {
        if let url = URL(string: user.picture.large) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: 300
                        )
                        .clipped()
                    
                case .failure(let error):
                    Image(systemName: "xmark.circle")
                    
                @unknown default:
                    EmptyView()
                }

            }
        }
    }
}

