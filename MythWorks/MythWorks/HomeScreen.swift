//
//  ContentView.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/4/25.
//

import SwiftUI

struct HomeScreen: View {
    @State var router = DragonRouter()
    let dragons = Dragon.dragons
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            DragonListView(dragons: dragons)
                .navigationDestination(for: DragonRouter.Route.self) { route in
                    router.view(for: route)
                }
        }
        .environment(router)
    }
}

#Preview {
    HomeScreen()
}
