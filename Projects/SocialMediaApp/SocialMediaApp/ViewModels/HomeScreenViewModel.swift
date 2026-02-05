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
    var selectedPost: MockPostModel? = nil
    var user: User?
    
    
    var posts: [MockPostModel] = []
    
    // Initializing the properties such as the Mock API Service
    init(apiService: ApiService, selectedPost: MockPostModel? = nil) {
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
    func clickLike(post: MockPostModel) async throws {
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
