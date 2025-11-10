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
    let profilePicture: String?
    let bio: String?
    
    static var user = User(username:"EWW", profilePicture: nil, bio: nil)
}

struct Post: Codable, Identifiable {
    var id = UUID()
    let picture: String?
    let user: User
    var likes: Int
    var comments: [Comment]
    
    mutating func clickLike() {
        self.likes += 1
    }
    
    mutating func clickComment(user: User, input: String) {
        comments.append(Comment(user: user, content: input))
    }

}

struct Comment: Codable, Identifiable {
    var id = UUID()
    let user: User
    let content: String
}

@Observable
class HomeScreenViewModel {
    var posts: [Post] = mockPosts
    private var liked: Bool = false
    var showingSheet = false
    
    func clickLike(post: Post) {
        guard let index = posts.firstIndex(where: { $0.id == post.id }) else { return }
        posts[index].clickLike()
    }

        // convenience to add a comment
    func addComment(to post: Post, user: User, content: String) {
        guard let index = posts.firstIndex(where: { $0.id == post.id }) else { return }
        posts[index].clickComment(user: user, input: content)
    }
}
