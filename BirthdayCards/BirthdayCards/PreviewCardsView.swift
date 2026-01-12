//
//  ContentView.swift
//  BirthdayCards
//
//  Created by Masimo Stephenson on 1/9/26.
//

import SwiftUI

struct PreviewCardsView: View {
    @State var cards: [Card] = []
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    Spacer().frame(height: 35)
                    Text("Preview Cards")
                        .font(.largeTitle.bold())
                    LazyVStack {
                        ForEach(cards) { card in
                            CardView(card: card)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
                    .scrollTargetLayout()
                }.frame(maxHeight: .infinity)
                    .scrollTargetBehavior(.viewAligned)
            }.ignoresSafeArea()
            
                .toolbar {
                    NavigationLink("+") {
                        CreateCardView(cards: $cards)
                    }
                }
        }
        .padding()
    }
}

#Preview {
    PreviewCardsView()
}
