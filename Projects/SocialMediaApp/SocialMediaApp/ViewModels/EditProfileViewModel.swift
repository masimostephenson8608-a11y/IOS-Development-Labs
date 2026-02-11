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
    var newUsername = ""
    var newBio = ""
    var newInterests: [String] = []

    init(homeViewModel: HomeScreenViewModel) {
        self.homeViewModel = homeViewModel
    }

//    func saveChanges() {
//        homeViewModel.user?.username = newUsername
//        homeViewModel.user?.bio = newBio
//        homeViewModel.user?.techInterests = newInterests
//    }
}
