//
//  ContentView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import SwiftUI

struct HomeScreen: View {
    @State var viewModel: HomeScreenViewModel // MAKE INSTANCE OF HomeScreenViewModel
    let user: User
    
    init(user: User, viewModel: HomeScreenViewModel) {   // Initailizer for the user and the STATE of the viewModel
        self._viewModel = State(wrappedValue: viewModel)
        self.user = user
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.white, .black], center: .bottomLeading, startRadius: 1000, endRadius: 200).ignoresSafeArea()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.posts) { post in
                            ZStack {
                                VStack {
                                    Spacer()        // Getting the profile photos to display above the posts
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
                        .sheet(item: $viewModel.selectedPost) { post in  // Making the sheet view for the Comments View
                            CommentView(user: user, viewModel: CommentViewModel(homeViewModel: viewModel, postID: post.id))
                        }
                    }
                }
            }
            .navigationTitle("For You Page")
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear() {
            Task {
                try await viewModel.fetchPosts()  // MARK: Fetch Posts
            }
        }
    }
}

#Preview {
    HomeScreen(user: User(username: "masimo", profilePicture: nil, bio: nil), viewModel: HomeScreenViewModel(apiService: MockAPIService(), selectedPost: nil))
}

//MARK: MockPosts
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
