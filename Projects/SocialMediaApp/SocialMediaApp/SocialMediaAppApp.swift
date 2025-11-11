//
//  SocialMediaAppApp.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import SwiftUI

@main
struct SocialMediaAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen(user: User(username: "Masimo", profilePicture: nil, bio: nil), viewModel: HomeScreenViewModel(apiService: MockAPIService()))
        }
    }
}
