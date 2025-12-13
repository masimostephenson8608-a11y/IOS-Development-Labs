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
    
    var body: some View {
        VStack {
            if gameStarted == true {
                Text("\(countDown)")
                    .font(.system(size: 500))
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
                    .onAppear() {
                        animateNumber()
                    }
            } else if showGo == true {
                Text("GO!")
                    .font(.system(size: 200))
                    .scaleEffect(goScaleEffect)
                    .onAppear(perform: goAnimation)
            }
            Spacer()
            Button("Start Countdown") {
                gameStarted = true
            }
        }
        .padding()
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

    }
}

#Preview {
    ContentView()
}
