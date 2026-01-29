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
    @State var newPost = false
    
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
                            PostCellView(viewModel: viewModel, post: post)
                        }
                        .sheet(item: $viewModel.selectedPost) { post in  // Making the sheet view for the Comments View
                            CommentView(user: user, viewModel: CommentViewModel(homeViewModel: viewModel, postID: post.id))
                        }
                    }
                }
            }
            .navigationTitle("For You Page")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {
                    newPost.toggle()
                } label: {
                    Text("+")
                }
            }
            .sheet(isPresented: $newPost) {
                NewPostView(viewModel: NewPostViewModel(homeViewModel: viewModel))
            }
        }
        .onAppear() {
            if viewModel.posts.isEmpty {
                Task {
                    try await viewModel.fetchPosts()  // MARK: Fetch Posts
                }
            }
        }
    }
}

#Preview {
    HomeScreen(user: User(firstName: "HAHA", lastName: "HAHA", username: "masimo", profilePicture: nil, bio: nil), viewModel: HomeScreenViewModel(apiService: MockAPIService(), selectedPost: nil))
}


