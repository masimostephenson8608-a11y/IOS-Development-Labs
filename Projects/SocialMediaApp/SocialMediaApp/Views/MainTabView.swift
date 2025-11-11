//
//  MainTabView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {           // TAB VIEW FOR HOME SCREEN AND PROFILE SCREEN
            Tab() {
                HomeScreen(user: User(username: "Masimo", profilePicture: nil, bio: nil), viewModel: HomeScreenViewModel(apiService: MockAPIService()))
            } label: {
                Image(systemName: "house.fill")
                Text("For you")
            }
            
            Tab () {
                
            } label: {
                Image(systemName: "person.circle.fill")
                Text("Profile")
            }
        }
    }
}
