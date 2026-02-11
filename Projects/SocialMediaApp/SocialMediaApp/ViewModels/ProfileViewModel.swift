////
////  ProfileViewModel.swift
////  SocialMediaApp
////
////  Created by Masimo Stephenson on 1/29/26.
////
//
//import Foundation
//import SwiftUI
//import Observation
//
//
//@Observable
//class ProfileViewModel {
//    var homeViewModel: HomeScreenViewModel
//    var posts: [MockPostModel] {
//        var userPosts: [MockPostModel] = []
//        Task {
//           try await homeViewModel.fetchPosts()
//        }
//        
//        for post in userPosts {
//            if post.user.id == homeViewModel.user?.id {
//                userPosts.append(post)
//            }
//        }
//        return userPosts
//    }
//    
//    init(homeViewModel: HomeScreenViewModel) {
//        self.homeViewModel = homeViewModel
//    }
//}
