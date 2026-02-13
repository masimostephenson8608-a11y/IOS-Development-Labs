//
//  EditProfileViewModel.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//

import Foundation
import SwiftUI
import Observation

@Observable
class EditProfileViewModel {
    var homeViewModel: HomeScreenViewModel
    var profile: Profile
    var newUsername = ""
    var newBio = ""
    var newInterests: [String] = []

    init(homeViewModel: HomeScreenViewModel, profile: Profile) {
        self.homeViewModel = homeViewModel
        self.profile = profile
    }

    func saveChanges() async {
        var newInterestResults: String
        
        profile.userName = newUsername
        profile.bio = newBio
        
        for count in 0..<newInterests.count {
            newInterests[count] += ","
            if !newInterests.last!.contains(",") && newInterests.count == count {
                newInterests[newInterests.count] += ","
            }
        }
        newInterestResults = newInterests.joined()
        profile.techInterests = newInterestResults
        
        try? await homeViewModel.apiService.updateProfile(userSecret: homeViewModel.user!.secret, profile: profile, secret: homeViewModel.user!.secret)
        
        homeViewModel.shouldRefreshBetweenProfileAndHomeViews = true
    }
}
