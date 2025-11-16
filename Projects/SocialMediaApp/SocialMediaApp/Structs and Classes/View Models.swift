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
    //Every viewModel links back to the HomeScreenViewModel where the apiService is initialized
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
    var posts: [Post] {
        var userPosts: [Post] = []
        Task {
           try await homeViewModel.fetchPosts()
        }
        
        for post in userPosts {
            if post.user.id == homeViewModel.user?.id {
                userPosts.append(post)
            }
        }
        return userPosts
    }
    
    init(homeViewModel: HomeScreenViewModel) {
        self.homeViewModel = homeViewModel
    }
}

@Observable
class EditProfileViewModel {
    var homeViewModel: HomeScreenViewModel
    var newUsername = ""
    var newBio = ""
    var newInterests: [String] = []

    init(homeViewModel: HomeScreenViewModel) {
        self.homeViewModel = homeViewModel
    }

    func saveChanges() {
        homeViewModel.user?.username = newUsername
        homeViewModel.user?.bio = newBio
        homeViewModel.user?.interests = newInterests
    }
    //Unaware how the background photos will be recieved, so not adding a way to edit the profile picture yet.
    
    /*
     var username: String
     var profilePicture: String?
     var backgroundProfilePicture: String?
     var bio: String?
     var interests: [String] = []
     */
}

@Observable
class NewPostViewModel {
    var homeViewModel: HomeScreenViewModel
    var picture: String = ""
    
    init(homeViewModel: HomeScreenViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    func makeNewPost() {
        if let user = homeViewModel.user {
            homeViewModel.posts.append(Post(picture: picture, user: user, likes: 0, comments: []))
        }
        picture = ""
    }
}
