//
//  DragonDetailView.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/4/25.
//

import SwiftUI

struct DragonDetailView: View {
    let dragon: Dragon
    var body: some View {
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
                                    .background(Capsule().foregroundStyle(.gray))
                            }
                        }
                    }
                }
                .padding(5)
                .background(Capsule().foregroundStyle(.black))

                HStack {
                    Text("Abilities: ")
                        .foregroundStyle(.white)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(dragon.abilities, id: \.self) { ability in
                                Text(ability).font(.footnote)
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .background(Capsule().foregroundStyle(.gray))
                            }
                        }
                    }
                }
                .padding(5)
                .background(Capsule().foregroundStyle(.black))
            }
            .padding(.horizontal, 15)
        }
    }
}
