//
//  DragonListView.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/5/25.
//

import SwiftUI

struct DragonListView: View {
    @Environment(SettingsViewModel.self) var color
    @Environment(DragonRouter.self) var router
    let dragons: [Dragon]
    var body: some View {
        ZStack {
            color.color.ignoresSafeArea()
            VStack {
                List(dragons) { dragon in
                    Section {
                        HStack {
                            NavigationLink(value: DragonRouter.Route.dragonDetail(dragon: dragon)) {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text(dragon.name)
                                            .foregroundStyle(.black)
                                            .bold()
                                        Text(dragon.species)
                                            .foregroundStyle(.black.secondary)
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                }.scrollContentBackground(.hidden)
                .listRowBackground(Rectangle().foregroundStyle(color.color)
                    .frame(maxWidth: .infinity, maxHeight: .infinity))
                .toolbar {
                    ToolbarItem {
                        NavigationLink(value: DragonRouter.Route.settings) {
                            Text("Color")
                        }
                    }
                }
            }
        }
    }
}
