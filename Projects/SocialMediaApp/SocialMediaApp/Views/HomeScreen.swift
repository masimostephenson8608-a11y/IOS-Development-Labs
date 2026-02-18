//
//  ContentView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import SwiftUI

struct HomeScreen: View {
    @State var viewModel: HomeScreenViewModel // MAKE INSTANCE OF HomeScreenViewModel
    let user: SignInResponse
    @State var newPost = false
    @State var shouldRefresh = false
    init(user: SignInResponse, viewModel: HomeScreenViewModel) {   // Initailizer for the user and the STATE of the viewModel
        self._viewModel = State(wrappedValue: viewModel)
        self.user = user
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView().ignoresSafeArea()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.posts) { post in
                            PostCellView(viewModel: viewModel, post: post, shouldRefresh: $shouldRefresh)
                        }
                        
                        
                        .sheet(item: $viewModel.selectedPost) { post in  // Making the sheet view for the Comments View
                            CommentView(viewModel: CommentViewModel(homeViewModel: viewModel), shouldRefresh: $shouldRefresh, postID: post.id)
                        }
                    }.id(shouldRefresh)
                }.refreshable {
                    try? await viewModel.fetchPosts()
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
                NewPostView(viewModel: NewPostViewModel(homeViewModel: viewModel, userSecret: user.secret), shouldRefresh: $shouldRefresh)
            }
        }
        .onAppear() {
            if viewModel.posts.isEmpty {
                Task {
                    try await viewModel.fetchPosts()  // MARK: Fetch Posts
                }
            }
        }
        .onChange(of: viewModel.posts) {
            viewModel.posts.sort(by: {$0.createdDate > $1.createdDate})
        }
        
        .onChange(of: shouldRefresh) {_, newValue in
            if newValue == true {
                do {
                    Task {
                        try await viewModel.fetchPosts()
                        viewModel.addCommentNum()
                        viewModel.posts.sort(by: {$0.createdDate > $1.createdDate})
                        shouldRefresh = false
                    }
                }
            }
        }
        
        .onChange(of: viewModel.shouldRefreshBetweenProfileAndHomeViews) {
            shouldRefresh = true
            viewModel.shouldRefreshBetweenProfileAndHomeViews = false
        }
    }
}

#Preview {
    HomeScreen(user: SignInResponse(email: "email", userUUID: "UserID", firstName: "Masimo", lastName: "preview", secret: "mockID", userName: "PreMasi"),
               viewModel: HomeScreenViewModel(apiService: ApiService()))
}


