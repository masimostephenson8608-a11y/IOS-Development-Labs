//
//  Comment.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI

struct Comment: Codable, Identifiable {
    /*
     "commentId": "UUID",
       "body": "string",
       "userName": "string",
       "userId": "UUID",
       "createdDate": "2025-06-30T00:00:00Z"
     */
    let id: String
    var body: String
    var userName: String
    var userId: String
    var createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "commentId"
        case body, userName, userId, createdDate
    }
    
    init(from decoder: any Decoder) throws {
        var values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        body = try values.decode(String.self, forKey: .body)
        userName = try values.decode(String.self, forKey: .userName)
        userId = try values.decode(String.self, forKey: .userId)
        createdDate = try values.decode(String.self, forKey: .createdDate)
    }
}
