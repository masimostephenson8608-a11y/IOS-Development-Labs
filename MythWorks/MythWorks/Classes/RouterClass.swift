//
//  RouterClass.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/4/25.
//

import Foundation
import Observation
import SwiftUI

@Observable
class DragonRouter {
    var navigationPath = NavigationPath()
    
    enum Route: Hashable {
        case dragonDetail(dragon: Dragon)
        
        case dragonList(dragons: [Dragon])
        
        case abilities(dragon: Dragon)
        
        case settings
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .dragonDetail(let dragon):
            DragonDetailView(dragon: dragon)
            
        case .dragonList(dragons: let dragons):
            DragonListView(dragons: dragons)
            
        case .abilities(dragon: let dragon):
            AbilitiesView(dragon: dragon)
            
        case .settings:
            SettingsView()
            
        default:
                HomeScreen()
        }
    }
    
    func navigateTo(route: Route) {
        navigationPath.append(route)
    }
}
