//
//  DragonListView.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/5/25.
//

import SwiftUI

struct DragonListView: View {
    @Environment(DragonRouter.self) var router
    let dragons: [Dragon]
    var body: some View {
        NavigationStack {
            List(dragons) { dragon in
                Section {
                    Button {
                        router.navigateTo(route: .dragonDetail(dragon: dragon))
                    } label: {
                        Text(dragon.name)
                        Text(dragon.species)
                    }
                }
            }
        }
    }
}
