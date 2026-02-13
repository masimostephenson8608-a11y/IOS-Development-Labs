//
//  ProfileViewModel.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//

import Foundation
import SwiftUI
import Observation


@Observable
class ProfileViewModel {
    var homeViewModel: HomeScreenViewModel
    var profile: Profile?
    var selectedPost: Post? = nil
    
    var posts: [Post] = []
    
    var interests: [String] = []
    
    func getInterests() -> [String] {
        var results: [String] = []
        if let profile {
            let strings = profile.techInterests.split(separator: ",")
            for string in strings {
                results.append(String(string))
            }
        } else {
            return []
        }
        return results
    }
    
    func getUsersPosts() async -> [Post] {
        var userPosts: [Post] = []
        do {
            try await homeViewModel.fetchPosts()
        } catch {
            print(error)
        }
            
            
        for post in homeViewModel.posts {
                if post.authorUserId == homeViewModel.user!.userUUID {
                    userPosts.append(post)
                }
            }
            return userPosts
    }
    
    func getProfile() async -> Profile? {
        var result: Profile? = nil
        do {
                result = try await homeViewModel.apiService.getProfile(userUUID: homeViewModel.user!.userUUID, secret: homeViewModel.user!.secret)
        } catch {
            print(error)
        }
        if let result {
            return result
        } else {
            return nil
        }
    }
    
    init(homeViewModel: HomeScreenViewModel) {
        self.homeViewModel = homeViewModel
        Task {
            self.posts = await getUsersPosts()
            self.profile = await getProfile()
            self.interests = getInterests()
        }
        
    }
}
