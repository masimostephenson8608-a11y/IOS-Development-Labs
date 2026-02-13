//
//  MainTabView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import SwiftUI

struct MainTabView: View {
    @Environment(HomeScreenViewModel.self) var homeViewModel

    var body: some View {
        TabView {           // TAB VIEW FOR HOME SCREEN AND PROFILE SCREEN
            if let user = homeViewModel.user {
                Tab() {
                    HomeScreen(user: user, viewModel: homeViewModel )
                } label: {
                    Image(systemName: "house.fill")
                    Text("For you")
                }
                
                Tab () {
                    ProfileView(viewModel: ProfileViewModel(homeViewModel: homeViewModel))
                } label: {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
            }
        }.environment(homeViewModel)
    }
}
