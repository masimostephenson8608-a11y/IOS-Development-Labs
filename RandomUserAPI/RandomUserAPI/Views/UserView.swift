//
//  UserView.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//

import SwiftUI

struct UserView: View {
    let api = APIController()
    @Environment(SettingsViewModel.self) var settings
    @State var users: [User] = []

    var body: some View {
        VStack {
            if !users.isEmpty {
                ForEach(users, id: \.id.value) { user in
                    VStack {
                        Text("\(user.name.first) \(user.name.last)")
                        
                        ShowImageView(user: user)
                        
                        if settings.showBirthday {
                            HStack {
                                Text("""
Birthday: \(user.dob.date)
Age: \(user.dob.age)
""").multilineTextAlignment(.center)
                            }
                        }
                        
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
                    }
                }
                //location, email, login, registered, dob, phone, cell, id, and nat
            } else {
                Text("Retry")
                Button {
                    getData()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }.transition(.scale.combined(with: .opacity))
            .onAppear {
                getData()
            }
    }
    
    func getData() {
        Task {
            do {
                users = try await api.getUser()
            } catch {
                print(error)
            }
        }
        //            user = User.mock

    }
}

#Preview {
    UserView().environment(mocksettings)
}

let mocksettings = SettingsViewModel()
