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
    @Binding var shouldRefresh: Bool

    init(viewModel: EditProfileViewModel, shouldRefresh: Binding<Bool>) {
        self.viewModel = viewModel
        self._shouldRefresh = shouldRefresh
    }

    var body: some View {
        NavigationStack {
            List {
                TextField("Username", text: $viewModel.newUsername)
                if viewModel.profile.bio.isEmpty {
                    TextField("Bio", text: $viewModel.newBio)
                } else {
                    TextField(viewModel.profile.bio, text: $viewModel.newBio)
                }
                Section("Interests") {
                    ForEach(viewModel.newInterests.indices, id: \.self) { index in
                        HStack {

                            TextField("\(viewModel.newInterests[index])", text: $viewModel.newInterests[index])
                                .font(.title3)

                            Spacer()

                            Button {  // Button that Removes an interest
                                viewModel.newInterests.remove(at: index)
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
                Task {
                   await viewModel.saveChanges()
                    shouldRefresh = true
                }
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
            let interests = getInterests()
            viewModel.newInterests = interests
        }
    }
    
    func getInterests() -> [String] {
        var results: [String] = []
        let strings = viewModel.profile.techInterests.split(separator: ",")
        for string in strings {
            results.append(String(string))
        }
        return results
    }
    
}

//#Preview {
//    EditProfileView()
//}
