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
    let post: Post
   
    var body: some View {
        NavigationStack {
            if post.comments.isEmpty {
                Text("No Comments Yet")
            } else {
                VStack {
                    ForEach(post.comments) {comment in
                        Text(comment.content).font(.largeTitle)
                    }
                    
                }
                
            }
//            .navigationTitle("Comments")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "arrow.left.circle")
//                    }
//                }
//            }
        }
    }
}
