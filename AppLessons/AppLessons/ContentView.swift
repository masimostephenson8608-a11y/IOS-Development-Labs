//
//  ContentView.swift
//  AppLessons
//
//  Created by Masimo Stephenson on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let settingOptions = ["Settings", "Friends", "Saves", "More Info"]
        VStack(spacing: 15) {
            HStack() {
                HStack(spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable().foregroundStyle(.blue).frame(width: 75, height: 75, alignment: .topLeading)
                        .symbolEffect(.bounce.up.byLayer, options: .nonRepeating)
                    VStack(spacing: 15) {
                        Text("Username")
                        Text("Email")
                    }
                    
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.right.circle.fill").resizable().frame(width: 40, height: 40, alignment: .center).foregroundStyle(.blue)
                }
            }.frame(width: 350).padding().padding([.top, .bottom]).background(.black).containerShape(Capsule()).foregroundStyle(.white)
            HStack(alignment: .center, spacing: 150) {
                ZStack() {
                    Circle().fill(.black)
                    VStack() {
                        Image(systemName: "medal.fill")
                        Text("0")
                        Text("Rewards")
                    }
                }
                ZStack {
                    Circle().fill(.black)
                    VStack() {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        Text("0")
                        Text("Paragraphs")
                    }
                }
            }.frame(width: 350, height: 100, alignment: .center).background(.ultraThinMaterial).containerShape(.capsule).foregroundStyle(Color.accentColor)
        }.frame(width: 325).padding(30).overlay(RoundedRectangle(cornerRadius: 30, style: .circular).fill(.blendMode(.softLight)))
        Spacer(minLength: 50)
        HStack(spacing: -5) {
            ForEach(0...130, id: \.self) {text in Text("-")}
        }
        Spacer(minLength: 100)
        ZStack(alignment: .top) {
            
            RoundedRectangle(cornerRadius: 50).fill(.ultraThinMaterial).frame(height: 310)
            
            VStackLayout(alignment: .leading, spacing: 30) {
                ForEach(settingOptions, id: \.self) {text in Text(text).frame(width: 300, height: 50, alignment: .leading)
                }.padding(.leading, 20).background(.black).clipShape(RoundedRectangle(cornerRadius: 50)).foregroundStyle(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
