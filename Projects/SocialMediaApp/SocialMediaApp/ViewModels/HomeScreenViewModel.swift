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
    var profile: Profile? = nil
    var shouldRefreshBetweenProfileAndHomeViews = false
    
    var posts: [Post] = []
    
    init(apiService: ApiService, selectedPost: Post? = nil, user: SignInResponse? = nil) {
        self.apiService = apiService
        self.selectedPost = selectedPost
        }
    
    func fetchPosts() async throws {
        var page = 0
        var allPosts: [Post] = []

        while true {
            let newPosts = try await apiService.getPosts(userSecret: user!.secret, page)

            allPosts += newPosts

            if newPosts.count < 10 { break } // last page
            page += 1
        }

        self.posts = allPosts
        print("Posts after Function: \(self.posts.count)")
    }
    
    func postToggleLike(post: Binding<Post>) async throws {
        try await apiService.toggleLike(userSecret: user!.secret, postID: post.id)
        post.wrappedValue.toggleLike()
    }
    
    func addCommentNum() {
        self.posts = posts
    }
    
    func delete(postID: String) async {
        if let index = posts.firstIndex(where: {$0.id == postID} ) {
            posts.remove(at: index)
        }
       try? await apiService.deletePost(userSecret: user!.secret, postID: postID)
    }
}
