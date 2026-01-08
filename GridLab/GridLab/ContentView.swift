//
//  ContentView.swift
//  GridLab
//
//  Created by Masimo Stephenson on 1/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView() {
                Section("Hats") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(hats, id: \.name) { hat in
                                ItemCell(item: hat, color: Color.random())
                                    .frame(width: geometry.size.width, height: geometry.size.height / 6)
                            }
                        }
                        .scrollTargetLayout()
                    }.frame(width: geometry.size.width)
                    .scrollTargetBehavior(.viewAligned)
                }
                
                Spacer()
                    .frame(height: geometry.size.height / 8)
                
                Section("Shirts") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.fixed(geometry.size.width - 250)), GridItem(.fixed(geometry.size.width - 250))]) {
                            ForEach(shirts, id: \.name) { shirt in
                            ItemCell(item: shirt, color: Color.random())
                            }
                        }
                    }
                }
                
                Spacer()
                    .frame(height: geometry.size.height / 8)
                
                Section("Pants") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: geometry.size.width)),
                                         GridItem(.adaptive(minimum: geometry.size.width)),
                                         GridItem(.adaptive(minimum: geometry.size.width)),
                                         GridItem(.adaptive(minimum: geometry.size.width))]) {
                            ForEach(pants, id: \.name) { item in
                                ItemCell(item: item, color: Color.random())
                            }
                            .scrollTargetLayout()
                        }
                    }.scrollTargetBehavior(.paging)
                }
            }.frame(maxWidth: .infinity)
        }.padding(10)
    }
}

struct ItemCell: View {
    let item: Clothing
    let color: Color
    
    var body: some View {
        VStack {
            HStack {
                Text("\(item.name),")
                    .font(.title2.bold())
                Text(item.color)
                    .font(.title2.bold())
            }
            Text(item.size)
                .font(.title2.bold())
            Text(String(item.price))
                .font(.title2.bold())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: CGFloat(25))
                .foregroundStyle(color))
    }
}

#Preview {
    ContentView()
}


extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0.5...1),
            green: Double.random(in: 0.5...1),
            blue: Double.random(in: 0.5...1)
        )
    }
}
