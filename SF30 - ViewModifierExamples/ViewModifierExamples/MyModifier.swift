//
//  MyModifier.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 9/15/25.
//

import SwiftUI

struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .frame(width: 100, height: 100, alignment: .center)
            .padding(10)
            .foregroundStyle(.ultraThinMaterial)
            .background(Gradient(colors: [.red, .blue]))
            .containerShape(.circle)
    }
}

struct SpacingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 5, alignment: .center)
            .background(.ultraThickMaterial)
            .containerShape(.capsule)
    }
}

struct MainModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Standard", size: 50))
            .padding(5)
            .containerShape(.rect)
            .background(.red)
    }
}

extension View {
    func myModifier() -> some View {
        modifier(MyModifier())
    }
    func spacingModifier() -> some View {
        modifier(SpacingModifier())
    }
    func mainModifier() -> some View {
        modifier(MainModifier())
    }
}
