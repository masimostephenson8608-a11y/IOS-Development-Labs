//
//  CommentViewModel.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//

import Foundation
import SwiftUI
import Observation


@Observable
class CommentViewModel {
    //Every viewModel links back to the HomeScreenViewModel where the apiService is initialized
    var homeViewModel: HomeScreenViewModel
    var postID: UUID
    var content: String = ""
    
    init(homeViewModel: HomeScreenViewModel, postID: MockPostModel.ID) {
        self.homeViewModel = homeViewModel
        self.postID = postID
    }
        
    func addComment(user: User) {
//        guard let index = homeViewModel.posts.firstIndex(where: { $0.id == postID }) else { return }
//        homeViewModel.posts[index].newComment(user: user, input: content)
//        content = ""
    }
    
    var currentPost: MockPostModel? {
            homeViewModel.posts.first(where: { $0.id == postID })
        }

}
