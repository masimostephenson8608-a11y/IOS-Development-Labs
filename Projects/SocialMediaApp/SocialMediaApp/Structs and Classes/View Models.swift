//
//  View Models.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import Foundation
import SwiftUI
import Observation

@Observable
class HomeScreenViewModel {
    var apiService: APIService
    var selectedPost: Post? = nil
    
    var posts: [Post] = []
    
    init(apiService: APIService, selectedPost: Post? = nil) {
        self.apiService = apiService
        self.selectedPost = selectedPost
    }
    
    func fetchPosts() async throws {
        posts = try await apiService.getAllPosts()
    }
    
    func clickLike(post: Post) async throws {
        try await apiService.addLike(to: post)
        
        guard let index = posts.firstIndex(where: { $0.id == post.id }) else { return }
        if posts[index].liked == true {
            posts[index].clickDislike()
            posts[index].liked = false
        } else {
            posts[index].clickLike()
            posts[index].liked = true
        }
        
    }
}



@Observable
class CommentViewModel {
    var homeViewModel: HomeScreenViewModel
    var postID: UUID
    var content: String = ""
    
    init(homeViewModel: HomeScreenViewModel, postID: Post.ID) {
        self.homeViewModel = homeViewModel
        self.postID = postID
    }
        
    func addComment(user: User) {
        guard let index = homeViewModel.posts.firstIndex(where: { $0.id == postID }) else { return }
        homeViewModel.posts[index].newComment(user: user, input: content)
        content = ""
    }
    
    var currentPost: Post? {
            homeViewModel.posts.first(where: { $0.id == postID })
        }

}
