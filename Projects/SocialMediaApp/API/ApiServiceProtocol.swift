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
    func getAllPosts() async throws -> [MockPostModel]
    func addLike(to: MockPostModel) async throws
    func fetchUserData() async throws -> User
    func login(_ email: String, _ password: String) async throws -> signInResponse
    func getProfile(userUUID: String, secret: String) async throws -> Profile
}
