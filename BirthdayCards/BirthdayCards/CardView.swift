//
//  CardView.swift
//  BirthdayCards
//
//  Created by Masimo Stephenson on 1/9/26.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: geometry.size.width , height: geometry.size.height / 1.3)
                    .foregroundStyle(Color(red: Double(card.backgroundColorRGB?.r ?? 0),
                                    green: Double(card.backgroundColorRGB?.g ?? 0),
                                    blue: Double(card.backgroundColorRGB?.b ?? 0)))
                VStack {
                    Text(card.date.formatted(date: .abbreviated, time: .omitted))
                        .font(.title.bold())
                        .foregroundStyle(Color(red: Double(card.textColor?.r ?? 0.5),
                                            green: Double(card.textColor?.g ?? 0.5),
                                            blue: Double(card.textColor?.b ?? 0.5)))
                    
                    Image(uiImage: card.photo)
                        .resizable()
                        .frame(width: geometry.size.width - 20, height: geometry.size.height / 2)
                        .padding(.bottom, 35)
                    Text(card.description)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(red: Double(card.textColor?.r ?? 0.5),
                                        green: Double(card.textColor?.g ?? 0.5),
                                        blue: Double(card.textColor?.b ?? 0.5)))
                        .padding(10)
                }
            }
        }
    }
}
