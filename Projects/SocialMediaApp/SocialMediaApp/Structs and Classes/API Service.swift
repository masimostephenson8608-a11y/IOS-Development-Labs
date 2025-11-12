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
        return mockPosts
    }
    
    func addLike(to: Post) async throws {
        print("Liked!")
    }
    
    func fetchUserData() async throws -> User {
        return User(username: "", profilePicture: nil, bio: nil)
    }
}
