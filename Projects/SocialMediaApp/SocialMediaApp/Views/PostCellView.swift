//
//  PostCellView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/28/26.
//

import SwiftUI

struct PostCellView: View {
    @State var viewModel: HomeScreenViewModel
    let post: MockPostModel
    var body: some View {
        ZStack {
            VStack {
                Spacer()        // Getting the profile photos to display above the posts
                if let profilePhoto = post.user.profilePicture {
                    HStack {
                        Image(profilePhoto)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(.circle)
                            .padding(.horizontal, 10)
                        Text(post.user.username)
                            .font(.title2)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                } else {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.horizontal, 10)
                        Text(post.user.username)
                            .font(.title2)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                }
                if let photo = post.picture {
                    Image(photo).resizable()
                        .scaledToFit()
                }
                HStack {
                    Spacer()
                    Button {        // Button for liking posts
                        Task {
                            try await viewModel.clickLike(post: post)
                        }
                    } label: {
                        if post.liked == true {
                            Image(systemName: "heart.fill")
                        } else {
                            Image(systemName: "heart")
                        }
                    }
                    .frame(width: 35, height: 35).glassEffect()
                    Text("\(post.likes)")
                        .foregroundStyle(.white.secondary)
                    Spacer()
                    Button {
                        viewModel.selectedPost = post
                    } label: {
                        Image(systemName: "bubble")
                    }
                    .frame(width: 45, height: 45).glassEffect()
                    Text("\(post.comments.count)")
                        .foregroundStyle(.white.secondary)
                    Spacer()
                }
                .font(.title)
                Spacer()
                    .onAppear() {
                        print(post.comments)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
        }.glassEffect(in: RoundedRectangle(cornerRadius: 20)).padding(.horizontal, 20)

    }
}
