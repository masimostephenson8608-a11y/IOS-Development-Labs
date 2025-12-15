//
//  ContentView.swift
//  Animation
//
//  Created by Masimo Stephenson on 12/9/25.
//

import SwiftUI

struct ContentView: View {
    @State var countDown = 3
    @State var scaleEffect = 1.0
    @State var opacity = 0.0
    @State var showGo = false
    @State var goScaleEffect = 1.0
    @State private var gameStarted = false
    @State var showTransition = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            if !showTransition {
                VStack {
                    if gameStarted == true {
                        Text("\(countDown)")
                            .font(.system(size: 500))
                            .scaleEffect(scaleEffect)
                            .opacity(opacity)
                            .onAppear() {
                                animateNumber()
                            }
                            .matchedGeometryEffect(id: "go", in: namespace)
                    } else if showGo == true {
                        Text("GO!")
                            .font(.system(size: 200))
                            .scaleEffect(goScaleEffect)
                            .onAppear(perform: goAnimation)
                            .matchedGeometryEffect(id: "go", in: namespace)
                        Image(systemName: "person.fill")
                            .frame(width: 100, height: 100)
//                            .transition(.opacity.combined(with: .scale))
                            .matchedGeometryEffect(id: "hi", in: namespace, properties: [.frame, .position], anchor: .center)
                    }
                    Spacer()
                    Button("Start Countdown") {
                        gameStarted = true
                    }
                }
                .padding()
                .transition(.scale)
            } else {
                TransitionView(nameSpace: namespace).transition(.opacity.combined(with: .slide))
                    .zIndex(1)
            }
        }.animation(.easeInOut(duration: 1), value: showTransition)
    }
    
    func animateNumber() {
        switch countDown {
        case 1...3:
            withAnimation(.easeIn(duration: 1)) {
                scaleEffect = 0.4
                opacity = 1
            }
            
            
        case 0:
            gameStarted = false
            showGo = true
            
        default:
            gameStarted = false
        }
            
            Task {
                try? await Task.sleep(for: .milliseconds(1000))
                scaleEffect = 1
                opacity = 0
                countDown -= 1
                animateNumber()
            }
        }
    func goAnimation() {
        withAnimation(.easeIn(duration: 1)) {
            goScaleEffect = 1.5
        }
        
        Task {
            try? await Task.sleep(for: .milliseconds(1000))
        }
        
        withAnimation(.easeIn(duration: 1).delay(2)) {
            showTransition = true
        }

    }
}

#Preview {
    ContentView()
}
