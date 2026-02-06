//
//  API Service.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/11/25.
//

import Foundation
import SwiftUI
import Observation

protocol ApiServiceProtocol {
    func login(_ email: String, _ password: String) async throws -> signInResponse
    func getProfile(userUUID: String, secret: String) async throws -> Profile
    func updateProfile(userSecret: String, profile: Profile, secret: String) async throws
    func getPosts(userSecret: String, _ pageNumber: Int?) async throws -> [Post]
    func createPost(userSecret: String, postTitle: String, postBody: String) async throws
    func editPost(userSecret: String, postID: String, newTitle: String, newBody: String) async throws
    func deletePost(userSecret: String, postID: String) async throws
    func getComments(userSecret: String, postID: String, _ pageNumber: Int?) async throws -> [Comment]
    func createComment(userSecret: String, postID: String, commentContent: String) async throws
}
