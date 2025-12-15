//
//  TransitionView.swift
//  Animation
//
//  Created by Masimo Stephenson on 12/15/25.
//

import SwiftUI

struct TransitionView: View {
    var nameSpace: Namespace.ID
    @State var animate = false
    var body: some View {
            VStack {
                Text("Hi I transitioned!")
                    .padding(15)
                
                Image(systemName: "person.fill")
                    .frame(width: 20, height: 20)
                    .scaleEffect(3)
                    .matchedGeometryEffect(id: "hi", in: nameSpace, properties: [.frame, .position], anchor: .center)
            }.animation(.easeIn, value: animate)
            .onAppear() {
                animate = true
            }
    }
}
