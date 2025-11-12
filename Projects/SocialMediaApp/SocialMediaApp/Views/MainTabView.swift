//
//  MainTabView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import SwiftUI

struct MainTabView: View {
    @State var homeViewModel = HomeScreenViewModel(apiService: MockAPIService())
    var user = User(username: "Masimo Stephenson", profilePicture: nil, bio: "WHS 2026")
    var body: some View {
        TabView {           // TAB VIEW FOR HOME SCREEN AND PROFILE SCREEN
            Tab() {
                HomeScreen(user: user, viewModel: homeViewModel )
            } label: {
                Image(systemName: "house.fill")
                Text("For you")
            }
            
            Tab () {
                ProfileView(viewModel: ProfileViewModel(homeViewModel: homeViewModel, user: user))
            } label: {
                Image(systemName: "person.circle.fill")
                Text("Profile")
            }
        }
    }
}
