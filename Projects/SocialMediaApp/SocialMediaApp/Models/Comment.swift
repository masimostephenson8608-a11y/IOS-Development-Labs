//
//  Comment.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI

struct Comment: Codable, Identifiable {
    var id = UUID()
    let user: User
    let content: String
}
