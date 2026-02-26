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
    @State var selectedShowInfo: User? = nil

    var body: some View {
        VStack {
            if !users.isEmpty {
                ScrollView {
                    ForEach(users, id: \.id.value) { user in
                        VStack {
                            Text("\(user.name.first) \(user.name.last)")
                            
                            ShowUserImage(user: user)
                            
                            Button("Show Info") {
                                withAnimation {
                                    selectedShowInfo = user
                                }
                            }
                        }.overlay() {
                            if selectedShowInfo != nil {
                                ShowUserInfo(user: user, selectedShowInfo: $selectedShowInfo).transition(.opacity)
                            }
                        }
                        .glassEffect(.regular, in: .rect)
                    }
                }
                
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
//        Task {
//            do {
//                users = try await api.getUser()
//            } catch {
//                print(error)
//            }
//        }
        users = [User.mock]

    }
}

#Preview {
    UserView().environment(mocksettings)
}

let mocksettings = SettingsViewModel()
