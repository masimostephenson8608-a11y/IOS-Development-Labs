//
//  ViewModifiers.swift
//  AdvancedTechniquesLab
//
//  Created by Masimo Stephenson on 1/5/26.
//

import Foundation
import SwiftUI

struct textFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .frame(width: 300, height: 40)
            .foregroundStyle(.secondary))
            .shadow(color: .white, radius: 20, y: 10)
            .padding()
    }
}

struct buttonModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2.bold())
            .background(Capsule()
                .frame(width: 100, height: 25)
                .foregroundStyle(configuration.isPressed ? .white : .blue))
            .foregroundStyle(.secondary)
            .padding(15)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.spring(response: 0.3), value: configuration.isPressed)
    }
}
