//
//  ShowUserInfo.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/26/26.
//

import SwiftUI

struct ShowUserInfo: View {
    let user: User
    @Binding var selectedShowInfo: User?

    @Environment(SettingsViewModel.self) var settings
    var body: some View {
        VStack {
            if settings.showEmail {
                Text("Email: \(user.email)")
            }
            
            if settings.showPassword {
                Text("password: \(user.login.password)")
            }
            
            if settings.showCell {
                Text("Cell: \(user.cell)    Phone: \(user.phone)")
            }
            
            if settings.showGender {
                Text("Gender: \(user.gender)")
            }
            
            if settings.showLocation {
                Text("""
                Location: \(user.location.street.number) \(user.location.street.name)
                \(user.location.state),
                \(user.location.postcode)
                """).multilineTextAlignment(.center)
            }
            
            if settings.showNat {
                Text("Nation: \(user.nat)")
            }
            
            Button("Dismiss") {
                withAnimation {
                    selectedShowInfo = nil
                }
            }
        }.padding(10)
        .background(RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.gray))
    }
}
