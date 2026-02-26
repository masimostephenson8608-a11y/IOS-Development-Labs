//
//  Result.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//

import Foundation

struct APIResponse: Codable {
    var results: [User]
    var info: Info
}

struct Info: Codable {
    var seed: String
    var results: Int
    var page: Int
    var version: String
}
