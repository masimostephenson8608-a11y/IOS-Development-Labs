//
//  API Service.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import Foundation
import SwiftUI
import Observation

protocol APIService {
    func getAllPosts() async throws -> [Post]
    func addLike(to: Post) async throws
    func fetchUserData() async throws -> User
}

@Observable
class MockAPIService: APIService {
    func getAllPosts() async throws -> [Post] {
        return [
            Post(picture: "Picture1", user: User.user, likes: 40, comments: []),
            Post(picture: "Picture2", user: User.user, likes: 20, comments: []),
            Post(picture: "Picture3", user: User.user, likes: 32, comments: [
                Comment(user: User.user, content: "Lame"),
                Comment(user: User.user, content: "WOw"),
                Comment(user: User.user, content: "No Way!"),
                Comment(user: User.user, content: "HI")
            ])
        ]
    }
    
    func addLike(to: Post) async throws {
        print("Liked!")
    }
    
    func fetchUserData() async throws -> User {
        return User(username: "Masimo Stephenson", profilePicture: nil, bio: "WHS 2026")
    }
}
