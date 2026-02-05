//
//  EditProfileView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/14/25.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel: EditProfileViewModel
    @State var refreshCounter: Int

    init(viewModel: EditProfileViewModel, user: User, refreshCounter: Int) {
        self.viewModel = viewModel
        self.refreshCounter = refreshCounter
    }

    var body: some View {
        NavigationStack {
            List {
                TextField("Username", text: $viewModel.newUsername)
                if let bio = viewModel.homeViewModel.user?.bio {
                    TextField(bio, text: $viewModel.newBio)
                } else {
                    TextField("Bio", text: $viewModel.newBio)
                }
                Section("Interests") {
                    ForEach($viewModel.newInterests, id: \.self) { $text in
                        HStack {

                            TextField("\(text)", text: $text)
                                .font(.title3)

                            Spacer()

                            Button {  // Button that Removes and interest
                                if let index = self.viewModel.newInterests
                                    .firstIndex(where: { $0 == text })
                                {
                                    viewModel.newInterests.remove(at: index)
                                }
                            } label: {
                                Text("-")
                                    .foregroundStyle(.white)
                                    .background(.red)
                                    .clipShape(.circle)
                                    .padding(10)
                                    .padding(.bottom, 20)
                            }.buttonStyle(.plain)
                        }
                    }
                }
                //                .onChange(of: $user.interests, )
            }
            Button {
                viewModel.newInterests.append("")
            } label: {
                Text("+")
                    .padding(.vertical, 15)
                    .padding(.horizontal, 25)
                    .background(
                        Capsule(style: .continuous)
                            .foregroundStyle(.secondary)
                    )
                    .foregroundStyle(.blue)
            }
            Spacer()

            Button {
                viewModel.saveChanges()
                refreshCounter += 1
                dismiss()
            } label: {
                Text("Save Changes")
                    .padding(20)
                    .background(
                        Capsule(style: .continuous)
                            .foregroundStyle(.secondary)
                    )
                    .foregroundStyle(.blue)
            }

            Spacer()
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            guard let interests = viewModel.homeViewModel.user?.techInterests else { return }
            viewModel.newInterests = interests
        }
    }
}

//#Preview {
//    EditProfileView()
//}
