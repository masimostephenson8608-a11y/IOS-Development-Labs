//
//  StructsandClasses.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import Foundation

//structs: User, Post, Comment

struct User: Codable {
    let username: String
    let profilePicture: String
    let bio: String?
}

struct Post: Codable {
    let picture: String?
    let user: User
    let likes: Int
    let comments: [Comment]
}

struct Comment: Codable {
    let user: User
    let content: String
}
