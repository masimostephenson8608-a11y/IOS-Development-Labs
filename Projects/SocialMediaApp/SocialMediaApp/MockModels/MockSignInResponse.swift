//
//  User.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI

struct MockSignInResponse: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    var username: String
    var profilePicture: String?
    var backgroundProfilePicture: String?
    var bio: String?
    var posts: [Post]
    var techInterests: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case id = "userUUID"
        case firstName
        case lastName
        case username = "userName"
        case profilePicture
        case backgroundProfilePicture
        case bio
        case posts
        case techInterests
    }
    
    init(id: String, firstName: String, lastName: String, userName: String, profilePicture: String?,
         backgroundProfilePicture: String?, bio: String?, posts: [Post], techInterests: [String]) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.username = userName
        self.profilePicture = profilePicture
        self.backgroundProfilePicture = backgroundProfilePicture
        self.bio = bio
        self.posts = posts
        self.techInterests = techInterests
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        username = try values.decode(String.self, forKey: .username)
        bio = try values.decode(String?.self, forKey: .bio)
        posts = try values.decode([Post].self, forKey: .posts)
        techInterests = try values.decode([String].self, forKey: .techInterests)
    }
}
