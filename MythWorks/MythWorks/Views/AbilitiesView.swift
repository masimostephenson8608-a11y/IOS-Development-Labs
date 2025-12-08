//
//  AbilitiesView.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/5/25.
//

import SwiftUI

struct AbilitiesView: View {
    @Environment(SettingsViewModel.self) var color
    let dragon: Dragon
    
    var body: some View {
        ZStack {
            color.color.ignoresSafeArea()
            VStack {
                Text("Abilities:")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    VStack {
                        ForEach(dragon.abilities, id: \.self) { power in
                            Text(power)
                                .font(.title)
                        }
                    }
                }
                .frame(height: 100)
                .padding(15)
                .glassEffect()
            }
        }
    }
}
