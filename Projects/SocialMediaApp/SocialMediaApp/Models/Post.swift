//
//  Post.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI

struct Post: Codable, Identifiable, Equatable, Hashable {

    let id: String
    let title: String
    let body: String
    let authorUserName: String
    let authorUserId: String
    var likes: Int
    var userLiked: Bool
    var numComments: Int
    let createdDate: String
    
    mutating func toggleLike() {
        if userLiked {
            likes -= 1
        } else {
            likes += 1
        }
        userLiked.toggle()
    }
    
    mutating func incComments() {
        self.numComments += 1
    }

    enum CodingKeys: String, CodingKey {
        case id = "postID"
        case title, body, authorUserName, authorUserId
        case likes, userLiked, numComments, createdDate
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        body = try values.decode(String.self, forKey: .body)
        authorUserName = try values.decode(String.self, forKey: .authorUserName)
        authorUserId = try values.decode(String.self, forKey: .authorUserId)
        likes = try values.decode(Int.self, forKey: .likes)
        userLiked = try values.decode(Bool.self, forKey: .userLiked)
        numComments = try values.decode(Int.self, forKey: .numComments)
        createdDate = try values.decode(String.self, forKey: .createdDate)
    }
}


