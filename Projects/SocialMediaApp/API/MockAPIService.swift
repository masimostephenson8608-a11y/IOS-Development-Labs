//
//  MockAPIService.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI
import Observation

//@Observable
//class MockAPIService: ApiServiceProtocol {
//    func login(_ email: String, _ password: String) async throws -> signInResponse {
//        <#code#>
//    }
//    
//    func getProfile(userUUID: String, secret: String) async throws -> Profile {
//        <#code#>
//    }
//    
//    func login(_ email: String, _ password: String) async throws {
//        return
//    }
//
//    func getAllPosts() async throws -> [Post] {
//        return [
//            Post(picture: "Picture1", user: User.user, likes: 40, comments: []),
//            Post(picture: "Picture2", user: User.user, likes: 20, comments: []),
//            Post(picture: "Picture3", user: User.user, likes: 32, comments: [
//                Comment(user: User.user, content: "Lame"),
//                Comment(user: User.user, content: "WOw"),
//                Comment(user: User.user, content: "No Way!"),
//                Comment(user: User.user, content: "HI")
//            ])
//        ]
//    }
//    
//    func addLike(to: Post) async throws {
//        print("Liked!")
//    }
//    
//    func fetchUserData() async throws -> User {
//        return User(id: "q34983279423", firstName: "Masimo", lastName: "Stephenson", userName: "Masimo Stephenson", profilePicture: "Picture1", backgroundProfilePicture: "Picture3", bio: "WHS 2026", posts: [], techInterests: ["iOS Development", "Hiking", "Charcuterie Boards"])
//    }
//}
