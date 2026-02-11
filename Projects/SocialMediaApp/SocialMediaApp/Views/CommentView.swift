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
    @State var viewModel: CommentViewModel
    @Binding var shouldRefresh: Bool
    let postID: String
    //MARK: Initializing Properties

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.comments.isEmpty {
                    Spacer()
                    Text("No Comments Yet")
                        .navigationTitle("Comments")
                        .navigationBarTitleDisplayMode(.inline)
                    Spacer()
                } else {
                    VStack {
                        List {
                            //MARK: ForEach Loop
                            ForEach(viewModel.comments) { (comment: Comment) in
                                Section {
                                    HStack {

                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .padding(.trailing, 15)

                                        Text("\(comment.userName)").font(
                                            .title2
                                        )
                                    }
                                    Text(comment.body).font(.title3)
                                }
                            }
                        }

                    }
                    .navigationTitle("Comments")
                    .navigationBarTitleDisplayMode(.inline)

                }

                Spacer()
                HStack {
                    TextField("Add Comment", text: $viewModel.content)
                        .font(.title2.bold())
                        .padding(20)
                    Spacer()
                    Button {
                        viewModel.addComment(postID: postID)
                        shouldRefresh = true
                    } label: {
                        Image(systemName: "arrow.up.message")
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        .onAppear {
            do {
                Task {
                    viewModel.comments = try await viewModel.getComments(postID: postID)
                }
            }
        }
        .onChange(of: viewModel.shouldRefresh) { _, newValue in
            if newValue == true {
                do {
                    Task {
                        viewModel.comments = try await viewModel.getComments(postID: postID)
                        viewModel.shouldRefresh = false
                        shouldRefresh = true
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
