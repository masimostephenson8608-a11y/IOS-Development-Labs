//
//  MainTabView.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Recipes",
                systemImage: "fork.knife.circle.fill") {
                    MyRecipesScreen()
            }
            
            Tab {
                DiscoverScreen()
            } label: {
                Text("Discover")
                Image(systemName: "globe.americas.fill")
            }
            
            
        }
    }
}



#Preview {
    MainTabView()
}
