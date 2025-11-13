//
//  View Models.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import Foundation
import SwiftUI
import Observation

//MARK: HomeScreenViewModel
@Observable
class HomeScreenViewModel {
    var apiService: APIService
    var selectedPost: Post? = nil
    var user: User?
    
    
    var posts: [Post] = []
    
    // Initializing the properties such as the Mock API Service
    init(apiService: APIService, selectedPost: Post? = nil) {
        self.apiService = apiService
        self.selectedPost = selectedPost
        Task {
            await loadUser()
        }
    }
    
    func fetchPosts() async throws {
        posts = try await apiService.getAllPosts()
    }
    
    func loadUser() async {
        do {
            self.user = try await apiService.fetchUserData()
        } catch {
            print("Failed to load user:", error)
        }
    }
    
    // Function to like posts
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

@Observable
class ProfileViewModel {
    var homeViewModel: HomeScreenViewModel
    let user: User
    var posts: [Post] {
        var userPosts: [Post] = []
        Task {
           try await homeViewModel.fetchPosts()
        }
        
        for post in userPosts {
            if post.user.id == user.id {
                userPosts.append(post)
            }
        }
        return userPosts
    }
    
    init(homeViewModel: HomeScreenViewModel, user: User) {
        self.homeViewModel = homeViewModel
        self.user = user
    }
}
