//
//  Login.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//
import Foundation

struct Login: Codable {
    var uuid: String
    var username: String
    var password: String
    var salt: String
    var md5: String
    var sha1: String
    var sha256: String
}
