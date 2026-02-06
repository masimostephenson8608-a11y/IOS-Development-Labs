//
//  Post.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI

struct MockPostModel: Codable, Identifiable {
    var id = UUID()
    let picture: String?
    var user: User
    var likes: Int
    var comments: [MockCommentModel]
    var liked = false
    
//    mutating func clickLike() {
//        self.likes += 1
//    }
//    
//    mutating func clickDislike() {
//        self.likes -= 1
//    }
//    
//    mutating func newComment(user: User, input: String) {
//        comments.append(Comment(user: user, content: input))
//    }
//    
//    mutating func addPostToUser(post: MockPostModel) {
//        user.posts.append(post)
//    }

}


