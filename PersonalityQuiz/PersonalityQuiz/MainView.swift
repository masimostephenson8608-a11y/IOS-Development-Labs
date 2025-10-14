//
//  MainView.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            Text("HI")
        }
    }
}

struct TitleView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.sunrise)
                VStack {
                    Rectangle().frame(width: 1, height: 100).hidden()
                    Text("Welcome to my").font(.headline.weight(.heavy))
                    Text("Personality Quiz").font(.largeTitle.bold())
                    Spacer()
                }
                .padding(.vertical, 75)
            }
            .navigationTitle("")
            .toolbar {
                NavigationLink("Begin", destination: MainView())
            }
        }
    }
}

#Preview {
    TitleView()
}
