//
//  ContentView.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//

import SwiftUI

struct TabViewScreen: View {
    @State var settings = SettingsViewModel()
    var body: some View {
        TabView {
            Tab("User", systemImage: "person") {
                UserView().environment(settings)
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView(settings: $settings)
            }
        }
    }
}

#Preview {
    TabViewScreen()
}
