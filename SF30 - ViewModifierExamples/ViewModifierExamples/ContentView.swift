//
//  ContentView.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 8/27/25.
//

import SwiftUI

struct MyView: View {
  var body: some View {
      VStack(spacing: 4) {
          Text("My name is Masimo").mainModifier()
          Text("").spacingModifier()
          Text("I'm from Utah").mainModifier()
          Text("").spacingModifier()
          Text("I'm going to MTech").mainModifier()
      }
      Text("Hello World").myModifier()
  }
}

#Preview {
    MyView()
}
