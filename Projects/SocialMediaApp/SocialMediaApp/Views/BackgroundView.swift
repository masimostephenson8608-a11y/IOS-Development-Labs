//
//  BackgroundView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 2/10/26.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        RadialGradient(colors: [.white, .black], center: .bottomLeading, startRadius: 1000, endRadius: 200)
    }
}

#Preview {
    BackgroundView()
}
