//
//  ContentView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import SwiftUI

struct HomeScreen: View {
    @State var viewModel = HomeScreenViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.white, .black], center: .bottomLeading, startRadius: 1000, endRadius: 200).ignoresSafeArea()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.posts) { post in
                            ZStack {
                                VStack {
                                    Spacer()
                                    if let profilePhoto = post.user.profilePicture {
                                        HStack {
                                            Image(profilePhoto)
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
                                        Button {
                                            viewModel.clickLike(post: post)
                                        } label: {
                                            Image(systemName: "heart")
                                        }
                                        .frame(width: 35, height: 35).glassEffect()
                                        Text("\(post.likes)")
                                            .foregroundStyle(.white.secondary)
                                        Spacer()
                                        Button {
                                            viewModel.showingSheet = true
                                        } label: {
                                            Image(systemName: "bubble")
                                        }
                                        .frame(width: 45, height: 45).glassEffect()
                                        Text("\(post.comments.count)")
                                            .foregroundStyle(.white.secondary)
                                        Spacer()
                                            .sheet(isPresented: $viewModel.showingSheet) {
                                                CommentView(post: post)
                                            }
                                    }
                                    .font(.title)
                                    Spacer()
                                        .onAppear() {
                                            print(post.comments)
                                        }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(10)
                            }
                        }
                    }
                }
            }
            .navigationTitle("For You Page")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

var viewModel = HomeScreenViewModel()
#Preview {
    HomeScreen(viewModel: viewModel)
}


var mockPosts: [Post] = [
    Post(picture: "Picture1", user: User.user, likes: 40, comments: []),
    Post(picture: "Picture2", user: User.user, likes: 20, comments: []),
    Post(picture: "Picture3", user: User.user, likes: 32, comments: [
        Comment(user: User.user, content: "Lame"),
        Comment(user: User.user, content: "WOw"),
        Comment(user: User.user, content: "No Way!"),
        Comment(user: User.user, content: "HI")
    ])
]
