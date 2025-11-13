//
//  StructsandClasses.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import Foundation
import SwiftUI
import Observation

//structs: User, Post, Comment

struct User: Codable, Identifiable {
    var id = UUID()
    let username: String
    var profilePicture: String?
    var bio: String?
    var posts: [Post] = []
    
    static var user = User(username:"EWW", profilePicture: nil, bio: nil)
}

struct Post: Codable, Identifiable {
    var id = UUID()
    let picture: String?
    var user: User
    var likes: Int
    var comments: [Comment]
    var liked = false
    
    mutating func clickLike() {
        self.likes += 1
    }
    
    mutating func clickDislike() {
        self.likes -= 1
    }
    
    mutating func newComment(user: User, input: String) {
        comments.append(Comment(user: user, content: input))
    }
    
    mutating func addPostToUser(post: Post) {
        user.posts.append(post)
    }

}

struct Comment: Codable, Identifiable {
    var id = UUID()
    let user: User
    let content: String
}

