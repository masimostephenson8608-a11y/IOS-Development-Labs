//
//  Modifiers.swift
//  ButtonsLab
//
//  Created by Masimo Stephenson on 9/29/25.
//

import SwiftUI

struct customButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(Capsule().foregroundStyle(LinearGradient(colors: [.indigo, .purple, .blue], startPoint: .top, endPoint: .bottom)))
    }
}
