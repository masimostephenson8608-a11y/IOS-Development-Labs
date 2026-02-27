//
//  ShowUserInfo.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/26/26.
//

import SwiftUI

struct ShowUserInfo: View {
    @Binding var selectedShowInfo: User?

    @Environment(SettingsViewModel.self) var settings
    var body: some View {
        if let user = selectedShowInfo {
            VStack {
                List {
                    if settings.showEmail {
                        Text("Email: \(user.email)")
                            .foregroundStyle(.white)
                    }
                    
                    if settings.showPassword {
                        Text("password: \(user.login.password)")
                            .foregroundStyle(.white)
                    }
                    
                    if settings.showCell {
                        Text("""
                        Cell: \(user.cell)
                        Phone: \(user.phone)
                        """)
                            .foregroundStyle(.white)
                    }
                    
                    if settings.showGender {
                        Text("Gender: \(user.gender)")
                            .foregroundStyle(.white)
                    }
                    
                    if settings.showLocation {
                        Text("""
                Location: \(user.location.street.number) \(user.location.street.name),
                \(user.location.state), \(user.location.postcode)
                """).multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                    
                    if settings.showNat {
                        Text("Nation: \(user.nat)")
                            .foregroundStyle(.white)
                    }
                }
                Button("Dismiss") {
                    withAnimation {
                        selectedShowInfo = nil
                    }
                }.padding(5)
                    .foregroundStyle(.white)
                    .background(Capsule()
                        .foregroundStyle(.gray.secondary))
            }.padding(10)
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.gray))
        }
    }
}
