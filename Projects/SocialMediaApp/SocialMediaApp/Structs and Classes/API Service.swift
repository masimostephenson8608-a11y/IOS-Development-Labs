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
}

class MockAPIService: APIService {
    func getAllPosts() async throws -> [Post] {
        return mockPosts
    }
    
    func addLike(to: Post) async throws {
        print("Liked!")
    }
}
