//
//  ContentView.swift
//  SelectRandomUsers
//
//  Created by Masimo Stephenson on 2/23/26.
//

import SwiftUI

struct UserScreenView: View {
    @State var viewModel: UserScreenViewModel
    @State var editMode = false
    @State var showAddUser = false
    @State var addUserName = ""

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(viewModel.names, id: \.self) { user in
                        Text(user.name)
                            .frame(width: 100)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(user.selected ? Color.blue.opacity(0.5) : Color.blue)
                    )
                    }
                }
                Spacer()

                Stepper(
                    "Select Amount: \(viewModel.selectAmount)",
                    value: $viewModel.selectAmount,
                    in: 0...viewModel.names.count,
                    step: Int.Stride(1.0)
                )
                .padding()

                Button("Randomly Select") {
                    viewModel.randomSelect()
                }.padding()
            }
            .overlay {
                if showAddUser == true {
                    AddUserView
                }
            }.transition(.opacity)
            .toolbar {
                ToolbarItem {
                    //MARK: FINISH EDIT BUTTON
                    Button("Edit") {
                        if editMode == false {
                            editMode = true
                        } else {
                            editMode = false
                        }
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Add User") {
                        withAnimation {
                            showAddUser = true
                        }
                    }
                }
            }

        }  //END NAVIGATION
        .padding()
    }
    
    var AddUserView: some View {
            VStack {
                TextField("User Name", text: $addUserName)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 25)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .glassEffect()
                    )
                    .onChange(of: addUserName) {_, newValue in
                       if newValue.count > 10 {
                           addUserName = String(newValue.prefix(10))
                       }
                   }
                
                HStack {
                    Button("Submit") {
                        viewModel.addUser(user: User(name: addUserName))
                        addUserName = ""
                        withAnimation {
                            showAddUser = false
                        }
                        
                    }.foregroundStyle(.white)
                        .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.blue)
                            .glassEffect()
                    )
                    Button("Cancel") {
                        addUserName = ""
                        withAnimation {
                            showAddUser = false
                        }
                    }.padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .glassEffect()
                    )
                }
            }.padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.gray))
    }
}

var mockViewModel = UserScreenViewModel(names: [User(name: "Masimo"), User(name: "No"), User(name: "Jackson"), User(name: "Test"), User(name: "Test"), User(name: "Test"), User(name: "Test"), User(name: "Test"), User(name: "Test"), User(name: "Test")])

#Preview {
    UserScreenView(viewModel: mockViewModel)
}
