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
    @State var shouldRefresh = false

    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(
                    colors: [.gray, .black],
                    center: .bottomLeading,
                    startRadius: 1000,
                    endRadius: 150
                ).ignoresSafeArea()
                    VStack {
                        VStack {
                            ZStack {
                                VStack {
                                    HStack {
                                        VStack {
                                            HeaderView //MARK: Header View
                                        }
                                    }
                                    .padding(20)
                                }
                            }
                            
                            Spacer()
                            
                            InfoView //MARK: Info View
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                            
                            
                            
                            //MARK: Posts Views
                            if !viewModel.posts.isEmpty {
                                List(viewModel.posts, id: \.id) { post in
                                    PostCellProfileView(viewModel: viewModel.homeViewModel,
                                    profileViewModel: viewModel,
                                    post: post,
                                    shouldRefresh: $shouldRefresh)
                                    .scrollTargetLayout()
                                    .listRowBackground(Color.clear)
                                    .swipeActions() {
                                            Button {
                                                Task {
                                                    await viewModel.homeViewModel.delete(postID: post.id)
                                                    shouldRefresh = true
                                                    viewModel.homeViewModel.shouldRefreshBetweenProfileAndHomeViews = true
                                                }
                                            } label: {
                                                Image(systemName: "trash")
                                            }.tint(.red)
                                        }
                                }.id(viewModel.posts.count)
                                    .scrollContentBackground(.hidden)
                                    .scrollTargetBehavior(.viewAligned)
//                                    .frame(height: 400)
                            } else {
                                Text("No Posts")
                                    .font(.largeTitle.bold()).foregroundStyle(.white)
                                    .padding(.vertical, 50)
                            }
                            
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Spacer()
                                
                    .onChange(of: shouldRefresh) {_, newValue in
                        if newValue == true {
                            Task {
                                viewModel.posts = await viewModel.getUsersPosts()
                                viewModel.profile = await viewModel.getProfile()
                                viewModel.interests = viewModel.getInterests()
                                viewModel.posts.sort(by: {$0.createdDate > $1.createdDate})
                                shouldRefresh = false
                            }
                        }
                    }
                
                    .onChange(of: viewModel.homeViewModel.shouldRefreshBetweenProfileAndHomeViews) {
                        _, newValue in
                        if newValue == true {
                            shouldRefresh = true
                        }
                    }
                //MARK: SHEET
                    .sheet(isPresented: $editProfile) {
                        EditProfileView(viewModel: EditProfileViewModel(homeViewModel: viewModel.homeViewModel,
                                                                        profile: viewModel.profile!),
                                        shouldRefresh: $shouldRefresh)
                    }
                
                    .sheet(item: $viewModel.selectedPost) { post in
                        CommentView(viewModel: CommentViewModel(homeViewModel: viewModel.homeViewModel), shouldRefresh: $shouldRefresh, postID: post.id)
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
        }
        .onAppear() {
            shouldRefresh = true
        }
    }
     
    //MARK: var HeaderView
    var HeaderView: some View {
        HStack {
            Spacer()
            Image(systemName:"person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.trailing, 15)
            
            Text(viewModel.profile?.userName ?? "Not found")
                .font(.title2.bold())
                .foregroundStyle(.secondary)
                .padding(.trailing, 40)
            Spacer()
        }
        .padding(.vertical, 15)
        .padding(20)
        .glassEffect(
            in: RoundedRectangle(cornerRadius: 25))
    }
    
    var InfoView: some View {
        HStack {
            if let profile = viewModel.profile {
                VStack {
                    Text("Bio:")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(20)
                    
                    Text("\(profile.bio)")
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
                if !viewModel.interests.isEmpty {
                    Text("Interests:")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(20)
                    
                    ForEach(viewModel.interests, id: \.self) { text in
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
}
