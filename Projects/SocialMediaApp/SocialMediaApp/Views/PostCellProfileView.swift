//
//  PostCellProfileView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 2/12/26.
//

import SwiftUI

struct PostCellProfileView: View {
    @State var viewModel: HomeScreenViewModel
    @State var profileViewModel: ProfileViewModel
    @State var post: Post
    @Binding var shouldRefresh: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()  // Getting the profile photos to display above the posts
                
                HStack {
                    Spacer()
                        .frame(maxWidth: 25)
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.horizontal, 10)
                    Text(post.authorUserName)
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                Text(post.title)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                Text(post.body)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 325)
                    .padding(10)
                    .padding(.bottom, 15)
                
                Text(post.createdDate)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Spacer()
                    
                    Button {  // Button for liking posts
                        Task {
                            try await viewModel.postToggleLike(post: $post)
                        }
                    } label: {
                        if post.userLiked == true {
                            Image(systemName: "heart.fill")
                        } else {
                            Image(systemName: "heart")
                        }
                    }.buttonStyle(.borderless)
                    
                    .frame(width: 35, height: 35).glassEffect()
                    Text("\(post.likes)")
                        .foregroundStyle(.white.secondary)
                    Spacer()
                    
                    Button {
                        profileViewModel.selectedPost = post
                    } label: {
                        Image(systemName: "bubble")
                    }.buttonStyle(.borderless)
                        
                    
                    .frame(width: 45, height: 45).glassEffect()
                    Text("\(post.numComments)")
                        .foregroundStyle(.white.secondary)
                    Spacer()
                }
                .font(.title)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white.tertiary)
                    .padding(.horizontal, 20)
            )
            .padding(10)
        }
    }
}
