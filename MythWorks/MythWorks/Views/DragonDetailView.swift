//
//  DragonDetailView.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/4/25.
//

import SwiftUI

struct DragonDetailView: View {
    @Environment(DragonRouter.self) var router
    @Environment(SettingsViewModel.self) var color
    let dragon: Dragon
    
    var body: some View {
        ZStack {
            color.color.ignoresSafeArea()
            ScrollView {
                VStack {
                    Text(dragon.name)
                        .font(.largeTitle)
                        .padding(15)
                    Text(dragon.species)
                        .font(.title)
                        .padding(20)
                    Image(dragon.image)
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                    Divider()
                    Text(dragon.lore)
                        .lineLimit(15)
                        .multilineTextAlignment(.center)
                        .padding(15)
                        .foregroundStyle(.black)
                        .font(.title2)
                    Text("Fire rating: \(dragon.fireRating)/10")
                    HStack {
                        Text("Weaknesses: ")
                            .foregroundStyle(.white)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(dragon.weaknesses, id: \.self) { weakness in
                                    Text(weakness).font(.footnote)
                                        .foregroundStyle(.white)
                                        .padding(5)
                                        .background(
                                            Capsule().foregroundStyle(.gray)
                                        )
                                }
                            }
                        }
                    }
                    .padding(5)
                    .background(Capsule().foregroundStyle(.black))
                    
                    NavigationLink(
                        value: DragonRouter.Route.abilities(dragon: dragon)
                    ) {
                        Text("Abilities")
                            .font(.title)
                            .foregroundStyle(.black)
                            .padding(10)
                            .background(Capsule().foregroundStyle(.black.secondary))
                    }
                }
                .padding(.horizontal, 15)
            }
        }
    }
}
