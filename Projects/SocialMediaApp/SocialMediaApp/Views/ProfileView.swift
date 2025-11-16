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
                if let image = viewModel.homeViewModel.user?.backgroundProfilePicture {
                    VStack {
                        Image(image)
                            .resizable()
                            .frame(height: 450)
                            .ignoresSafeArea()
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    HStack {

                        if let profilePhoto = viewModel.homeViewModel.user?.profilePicture {
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(profilePhoto)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(.circle)
                                        .padding(.horizontal, 10)
                                    Spacer()
                                    Text(viewModel.homeViewModel.user?.username ?? "Not found")
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
                            .glassEffect(in: RoundedRectangle(cornerRadius: 25))
                        } else {
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .padding(.trailing, 15)

                                    Text(viewModel.homeViewModel.user?.username ?? "Not found")
                                        .font(.title2.bold())
                                        .foregroundStyle(.secondary)
                                        .padding(.trailing, 40)
                                    Spacer()
                                }
                                .padding(.vertical, 15)
                            }
                            .padding(20)
                            .glassEffect(in: RoundedRectangle(cornerRadius: 25))
                        }
                    }
                    .padding(20)

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
                            if let interests = viewModel.homeViewModel.user?.interests {
                                if !interests.isEmpty {
                                    Text("Interests:")
                                        .font(.largeTitle.bold())
                                        .foregroundStyle(.white)
                                        .padding(20)
                                    
                                    ForEach(viewModel.homeViewModel.user?.interests ?? [""], id: \.self) {
                                        text in
                                        Text("\(text)").font(.title2)
                                            .foregroundStyle(.white.secondary)
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

                    if !(viewModel.homeViewModel.user?.posts ?? []).isEmpty {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.posts) { post in
                                    ZStack {
                                        VStack {
                                            Spacer()
                                            if let photo = post.picture {
                                                Image(photo).resizable()
                                                    .scaledToFit()
                                            }
                                            HStack {
                                                Spacer()
                                                Button {  // Button for liking posts
                                                    Task {
                                                        try await viewModel
                                                            .homeViewModel
                                                            .clickLike(
                                                                post: post
                                                            )
                                                    }
                                                } label: {
                                                    if post.liked == true {
                                                        Image(
                                                            systemName:
                                                                "heart.fill"
                                                        )
                                                    } else {
                                                        Image(
                                                            systemName: "heart"
                                                        )
                                                    }
                                                }
                                                .frame(width: 35, height: 35)
                                                .glassEffect()
                                                Text("\(post.likes)")
                                                    .foregroundStyle(
                                                        .white.secondary
                                                    )
                                                Spacer()
                                                Button {
                                                    viewModel.homeViewModel
                                                        .selectedPost = post
                                                } label: {
                                                    Image(systemName: "bubble")
                                                }
                                                .frame(width: 45, height: 45)
                                                .glassEffect()
                                                Text("\(post.comments.count)")
                                                    .foregroundStyle(
                                                        .white.secondary
                                                    )
                                                Spacer()
                                            }
                                            .font(.title)
                                            Spacer()
                                                .onAppear {
                                                    print(post.comments)
                                                }
                                        }
                                        .frame(
                                            maxWidth: .infinity,
                                            maxHeight: .infinity
                                        )
                                        .padding(10)
                                    }.glassEffect(
                                        in: RoundedRectangle(cornerRadius: 20)
                                    ).padding(.horizontal, 20)
                                }
                                .sheet(
                                    item: $viewModel.homeViewModel.selectedPost
                                ) { post in  // Making the sheet view for the Comments View
                                    CommentView(
                                        user: viewModel.homeViewModel.user ?? User(firstName: "", lastName: "", username: ""),
                                        viewModel: CommentViewModel(
                                            homeViewModel: viewModel
                                                .homeViewModel,
                                            postID: post.id
                                        )
                                    )
                                }
                            }
                        }

                        Spacer()
                    }
                }
                .padding(.vertical, 50)
            }
            .sheet(isPresented: $editProfile) {
                EditProfileView(
                    viewModel: EditProfileViewModel(
                        homeViewModel: viewModel.homeViewModel,
                    ),
                    user: viewModel.homeViewModel.user ?? User(firstName: "", lastName: "", username: ""),
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
    }
}

/*

 }
 */
