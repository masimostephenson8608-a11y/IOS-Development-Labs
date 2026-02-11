//
//  NewPostViewModel.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import Observation
import SwiftUI

@Observable
class NewPostViewModel {
    var homeViewModel: HomeScreenViewModel
    let userSecret: String
    var title: String
    var body: String
    var shouldRefresh: Bool

    init(homeViewModel: HomeScreenViewModel, userSecret: String) {
        self.homeViewModel = homeViewModel
        self.userSecret = userSecret
        self.title = ""
        self.body = ""
        self.shouldRefresh = false
    }

    func makeNewPost() {
        if title.isEmpty || body.isEmpty { return }
        do {
            Task {
                try await homeViewModel.apiService.createPost(
                    userSecret: userSecret,
                    postTitle: title,
                    postBody: body
                )
                shouldRefresh = true
            }
        } catch {
            print(error)
            return
        }
    }
}
