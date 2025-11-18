//
//  ProfileView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import SwiftUI

struct ProfileView: View {
    @State var viewModel: ProfileViewModel
    @State private var editProfile = false
    @State var refreshCounter = 0

    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(
                    colors: [.gray, .black],
                    center: .bottomLeading,
                    startRadius: 1000,
                    endRadius: 150
                ).ignoresSafeArea()
                ScrollView {
                    VStack {
                        ZStack {
                            if let image = viewModel.homeViewModel.user?
                                .backgroundProfilePicture
                            {
                                VStack {
                                    Image(image)
                                        .resizable()
                                        .frame(height: 450)
                                        .ignoresSafeArea()
                                }
                            }
                            VStack {
                                //                                    Spacer()
                                HStack {

                                    if let profilePhoto = viewModel
                                        .homeViewModel.user?
                                        .profilePicture
                                    {
                                        VStack {
                                            HStack {
                                                Spacer()
                                                Image(profilePhoto)
                                                    .resizable()
                                                    .frame(
                                                        width: 100,
                                                        height: 100
                                                    )
                                                    .clipShape(.circle)
                                                    .padding(.horizontal, 10)
                                                Spacer()
                                                Text(
                                                    viewModel.homeViewModel
                                                        .user?
                                                        .username ?? "Not found"
                                                )
                                                .font(.title2.bold())
                                                .foregroundStyle(.secondary)
                                                Spacer()

                                            }
                                            .padding(.vertical, 15)
                                            Text(
                                                "\(viewModel.homeViewModel.user?.firstName ?? "Not Found") \(viewModel.homeViewModel.user?.lastName ?? "Not found")"
                                            )
                                        }
                                        .padding(20)
                                        .glassEffect(
                                            in: RoundedRectangle(
                                                cornerRadius: 25
                                            )
                                        )
                                    } else {
                                        VStack {
                                            HStack {
                                                Spacer()
                                                Image(
                                                    systemName:
                                                        "person.circle.fill"
                                                )
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .padding(.trailing, 15)

                                                Text(
                                                    viewModel.homeViewModel
                                                        .user?
                                                        .username ?? "Not found"
                                                )
                                                .font(.title2.bold())
                                                .foregroundStyle(.secondary)
                                                .padding(.trailing, 40)
                                                Spacer()
                                            }
                                            .padding(.vertical, 15)
                                        }
                                        .padding(20)
                                        .glassEffect(
                                            in: RoundedRectangle(
                                                cornerRadius: 25
                                            )
                                        )
                                    }
                                }
                                .padding(20)
                            }
                        }

                        Spacer()

                        HStack {
                            if let bio = viewModel.homeViewModel.user?.bio {
                                VStack {
                                    Text("Bio:")
                                        .font(.largeTitle.bold())
                                        .foregroundStyle(.white)
                                        .padding(20)

                                    Text("\(bio)")
                                        .foregroundStyle(.white.secondary)
                                }
                            } else {
                                Spacer()
                                Text("No Bio")
                                    .font(.custom("Roboto", size: 50))
                                    .foregroundStyle(.white)
                                    .padding(20)
                            }

                            Spacer()

                            VStack {
                                if let interests = viewModel.homeViewModel.user?
                                    .interests
                                {
                                    if !interests.isEmpty {
                                        Text("Interests:")
                                            .font(.largeTitle.bold())
                                            .foregroundStyle(.white)
                                            .padding(20)

                                        ForEach(
                                            viewModel.homeViewModel.user?
                                                .interests ?? [""],
                                            id: \.self
                                        ) {
                                            text in
                                            Text("\(text)").font(.title2)
                                                .foregroundStyle(
                                                    .white.secondary
                                                )
                                        }
                                    } else {
                                        Text("No Interests")
                                            .font(.largeTitle.bold())
                                            .foregroundStyle(.white)
                                            .padding(20)
                                    }
                                }
                            }

                        }

                        Spacer()
                    }
                    Spacer(minLength: 100)
                    ProfilePostView(viewModel: viewModel)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
                .padding(.vertical, 50)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .sheet(isPresented: $editProfile) {
                    EditProfileView(
                        viewModel: EditProfileViewModel(
                            homeViewModel: viewModel.homeViewModel,
                        ),
                        user: viewModel.homeViewModel.user
                            ?? User(firstName: "", lastName: "", username: ""),
                        refreshCounter: refreshCounter
                    )
                }
                .toolbar {
                    ToolbarItem {
                        Button {
                            editProfile.toggle()
                        } label: {
                            Text("Edit")
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(0)
        .ignoresSafeArea()
    }
}

struct ProfilePostView: View {
    var viewModel: ProfileViewModel
    var body: some View {

        if let post = viewModel.homeViewModel.posts.last(where: {
            $0.user.id == viewModel.homeViewModel.user?.id
        }) {
            ZStack {
                VStack {

                    // Profile photo
                    HStack {
                        if let profilePhoto = post.user.profilePicture {
                            Image(profilePhoto)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(.circle)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        Text(post.user.username)
                            .font(.title2)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Picture
                    if let photo = post.picture {
                        Image(photo)
                            .resizable()
                            .scaledToFit()
                    }

                    // Likes/comments
                    HStack {
                        Spacer()
                        Image(systemName: "heart")
                        Text("\(post.likes)")
                            .foregroundStyle(.white.secondary)
                        Spacer()
                        Image(systemName: "bubble")
                        Text("\(post.comments.count)")
                            .foregroundStyle(.white.secondary)
                        Spacer()
                    }
                    .font(.title)

                    Spacer()
                }
                .padding(10)
            }
            .glassEffect(in: RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 20)
        } else {
            Text("No Posts")
                .font(.largeTitle.bold()).foregroundStyle(.white)
        }
    }
}
/*

 }
 */
