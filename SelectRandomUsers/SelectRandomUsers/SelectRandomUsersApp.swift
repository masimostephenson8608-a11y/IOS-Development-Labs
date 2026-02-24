//
//  SelectRandomUsersApp.swift
//  SelectRandomUsers
//
//  Created by Masimo Stephenson on 2/23/26.
//

import SwiftUI

@main
struct SelectRandomUsersApp: App {
    @State var userViewModel = UserScreenViewModel(names: [])
    var body: some Scene {
        WindowGroup {
            UserScreenView(viewModel: userViewModel)
        }
    }
}
