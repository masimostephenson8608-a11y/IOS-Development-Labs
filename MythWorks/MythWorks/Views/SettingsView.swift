//
//  SettingsView.swift
//  MythWorks
//
//  Created by Masimo Stephenson on 12/5/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(SettingsViewModel.self) var viewModel
    
    var body: some View {
        ZStack {
            viewModel.color.ignoresSafeArea()
            VStack {
                Text("Choose a color:")
                Button("Blue") {
                    changeColor(.blue)
                }
                Button("Yellow") {
                    changeColor(.yellow)
                }
                Button("Red") {
                    changeColor(.red)
                }
                Button("Gray") {
                    changeColor(.gray)
                }
                Button("Cyan") {
                    changeColor(.cyan)
                }
                Button("Green") {
                    changeColor(.green)
                }
                Button("Orange") {
                    changeColor(.orange)
                }
            }
        }
    }
    
    func changeColor(_ color: Color) {
        viewModel.color = color
    }
}
