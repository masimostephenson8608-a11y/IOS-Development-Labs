//
//  Profile.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/30/26.
//

import Foundation

struct Profile: Codable {
    
    let lastName: String
    let userUUID: String
    var userName: String
    let firstName: String
    var techInterests: String
    var posts: [Post] = []
    var bio: String
}
