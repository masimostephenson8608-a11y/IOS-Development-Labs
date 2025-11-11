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
                        Text("No Comments Yet")
                            .navigationTitle("Comments")
                            .navigationBarTitleDisplayMode(.inline)
                    } else {
                        VStack {
                            //MARK: ForEach Loop
                            ForEach(post.comments) { comment in
                                Text("\(comment.content)").font(.largeTitle)
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
