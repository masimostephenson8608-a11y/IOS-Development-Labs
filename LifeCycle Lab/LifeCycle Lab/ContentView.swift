//
//  ContentView.swift
//  LifeCycle Lab
//
//  Created by Masimo Stephenson on 10/21/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @State private var screenChange = false
    @State var event = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text(event)
            }
            .padding()
            .onChange(of: scenePhase) { newPhase in
                switch newPhase {
                case .background:
                    event += "Background, "
                case .inactive:
                    event += "Inactive, "
                    screenChange = true
                case .active:
                    event += "Active, "
                    return
                @unknown default:
                    return
                }
                
            }
            .navigationDestination(isPresented: $screenChange) { anotherView() }
        }
    }
}


struct anotherView: View {
    var body: some View {
        Text("Second Screen")
    }
}

#Preview {
    ContentView()
}
