//
//  NewPostViewModel.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI
import Observation

@Observable
class NewPostViewModel {
    var homeViewModel: HomeScreenViewModel
    var picture: String = ""
    
    init(homeViewModel: HomeScreenViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    func makeNewPost() {
        if let user = homeViewModel.user {
            homeViewModel.posts.append(MockPostModel(picture: picture, user: user, likes: 0, comments: []))
        }
        picture = ""
    }
}
