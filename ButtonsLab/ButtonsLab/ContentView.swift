//
//  ContentView.swift
//  ButtonsLab
//
//  Created by Masimo Stephenson on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    @State var isPressed = false
    @State var isPressed2 = false
    @State var clickCount = 0
    @State var showSquare = false

    @State var whoKnows = false
    var body: some View {
        VStack {
            let square = Rectangle()
            if showSquare == false {
                square.hidden()
            } else {
                square
            }
            Button {
                withAnimation(.bouncy) {
                    isPressed = true
                }
               
            } label: {
                Text("Button1").frame(width: 100, height: 25).foregroundStyle(.white)
            }.background(Capsule().foregroundStyle(.green)).scaleEffect(isPressed ? 1.5: 1.0)
            
            
            Button {
                
            } label: {
                Image(systemName: "heart.fill")

            }
            Button {
                
            } label: {
                Text("Button3")

            }.buttonStyle(customButton())
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isPressed2 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isPressed2 = false
                    }
                }
            } label: {
                Text("Button4").padding(10)

            }.buttonStyle(customButton()).scaleEffect(isPressed2 ? 1.5 : 1)
            Button {
                
            } label: {
                Text("Button5").padding(10)

            }.background(.red).clipShape(Capsule())
            Button {
                
            } label: {
                Text("Button6").padding(10)

            }.background(.ultraThickMaterial).clipShape(Capsule()).foregroundStyle(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
            Button {
                clickCount += 1
            } label: {
                Text("Count Up").font(.title).padding()

            }.frame(width: 125).background(.purple).clipShape(Circle())
            Button {
                showSquare.toggle()
            } label: {
                Text("Show the Square")

            }.frame(width: 150).background(Gradient(colors: [.black, .white])).clipShape(Capsule()).foregroundStyle(.red)
            Button {
                
            } label: {
                Text("Button9")

            }.background(Ellipse().foregroundStyle(.red))
            Button {
                
            } label: {
                Text("Button10")

            }.disabled(whoKnows).hidden()
            
            Text("Count: \(clickCount)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
