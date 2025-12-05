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
        NavigationStack {
            ScrollView {
                VStack {
                    Text(dragon.name)
                        .font(.largeTitle)
                    Text(dragon.species)
                        .font(.title)
                    Image(dragon.image)
                }
            }
        }
    }
}
