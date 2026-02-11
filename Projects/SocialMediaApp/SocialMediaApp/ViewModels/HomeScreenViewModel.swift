//
//  HomeScreenViewModel.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//

import Foundation
import SwiftUI
import Observation


@Observable
class HomeScreenViewModel {
    var apiService: ApiService
    var selectedPost: Post?
    var user: SignInResponse?
    var profile: Profile?
    
    
    var posts: [Post] = []
    
    // Initializing the properties such as the Mock API Service
    init(apiService: ApiService, selectedPost: Post? = nil, user: SignInResponse? = nil, profile: Profile? = nil) {
        self.apiService = apiService
        self.selectedPost = selectedPost
        }
    
    func fetchPosts() async throws {
        self.posts = try await apiService.getPosts(userSecret: user!.secret)
    }
    
    func postToggleLike(post: Binding<Post>) async throws {
        try await apiService.toggleLike(userSecret: user!.secret, postID: post.id)
        post.wrappedValue.toggleLike()
    }
    
    func addCommentNum() {
        self.posts = posts
    }
}
