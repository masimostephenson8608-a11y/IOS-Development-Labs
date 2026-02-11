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
    var content: String = ""
    let user: SignInResponse
    var comments: [Comment] = []
    var shouldRefresh = false
    
    init(homeViewModel: HomeScreenViewModel) {
        self.homeViewModel = homeViewModel
        self.user = homeViewModel.user!
    }
        
    func addComment(postID: String) {
        do {
            Task {
                try await homeViewModel.apiService.createComment(userSecret: homeViewModel.user!.secret, postID: postID, commentContent: content)
                content = ""
                shouldRefresh = true
            }
        }
    }
    
    func getComments(postID: String) async throws -> [Comment] {
                let results = try await homeViewModel.apiService.getComments(userSecret: user.secret, postID: postID)
                return results
    }
}
