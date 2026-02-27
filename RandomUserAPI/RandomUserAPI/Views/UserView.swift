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
        NavigationStack {
            VStack {
                if !users.isEmpty {
                    ScrollView {
                        ForEach(users, id: \.id.value) { user in
                            VStack {
                                Text("\(user.name.first) \(user.name.last)")
                                
                                //MARK: ShowImageUser View
                                ShowUserImage(user: user)
                                
                                Button("Show Info") {
                                    withAnimation {
                                        selectedShowInfo = user
                                    }
                                }
                                
                                //MARK: Overlay
                            }.overlay() {
                                if selectedShowInfo?.id == user.id {
                                    ShowUserInfo(selectedShowInfo: $selectedShowInfo).transition(.opacity)
                                }
                            }
                            .glassEffect(.regular.tint(.gray.opacity(0.3)), in: RoundedRectangle(cornerRadius: 25, style: .circular))
                            .padding()
                        }
                    }
                    
                    //MARK: Failed to get user
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
                    if users.isEmpty {
                        getData()
                    }
                }
            
                .toolbar {
                    Button {
                        getData()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .buttonStyle(.glass)
                    }
                }
        }
    }
    
    func getData() {
        Task {
            do {
                users = try await api.getUser(results: settings.resultCount)
            } catch {
                print(error)
            }
        }
//        var newUsers: [User] = []
//        if settings.resultCount < User.mockUsers.count {
//            for count in 0...settings.resultCount {
//                newUsers.append(User.mockUsers[count])
//                users = newUsers
//            }
//        } else {
//            users = User.mockUsers
//        }

    }
}

#Preview {
    UserView().environment(mocksettings)
}

let mocksettings = SettingsViewModel()
