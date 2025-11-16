//
//  CommentView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import Foundation
import SwiftUI

//class CommentViewModel {
//    var post: Post
//
//}

struct CommentView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    @State var viewModel: CommentViewModel
    //MARK: Initializing Properties

    var body: some View {
        NavigationStack {
            VStack {
                if let post = viewModel.currentPost {
                    if post.comments.isEmpty {
                        Spacer()
                        Text("No Comments Yet")
                            .navigationTitle("Comments")
                            .navigationBarTitleDisplayMode(.inline)
                        Spacer()
                    } else {
                        VStack {
                            List {
                                //MARK: ForEach Loop
                                ForEach(post.comments) { comment in
                                    Section {
                                        HStack {
                                            if let profilePicture = comment.user.profilePicture {
                                                Image(profilePicture)
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
                                                    .clipShape(.circle)
                                            } else {
                                                Image(systemName: "person.circle.fill")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                                    .padding(.trailing, 15)
                                                
                                            }
                                            Text(comment.user.username).font(.title2)
                                        }
                                        Text("\(comment.content)").font(.title3)
                                    }
                                }
                            }

                        }
                        .navigationTitle("Comments")
                        .navigationBarTitleDisplayMode(.inline)

                    }
                } else {
                    Text("Post Not Found")
                }
                Spacer()
                HStack {
                    TextField("Add Comment", text: $viewModel.content)
                        .font(.title2.bold())
                        .padding(20)
                    Spacer()
                    Button {
                        viewModel.addComment(user: user)
                    } label: {
                        Image(systemName: "arrow.up.message")
                    }
                    .padding(.trailing, 20)
                }
            }
        }
    }
}
