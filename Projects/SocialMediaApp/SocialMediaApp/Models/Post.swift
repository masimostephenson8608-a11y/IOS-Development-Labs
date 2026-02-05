//
//  Post.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI

struct Post: Codable, Identifiable {
//    var likes: Int
//    var comments: [Comment]
//    var liked = false
    
    var id: String
    var body: String
    
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
    
    enum CodingKeys: String, CodingKey {
        case id = "title"
        case body
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.body = try container.decode(String.self, forKey: .body)
    }

}


