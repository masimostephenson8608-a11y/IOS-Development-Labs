//
//  MockCommentModel.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 2/6/26.
//


import Foundation
import SwiftUI

struct MockCommentModel: Codable, Identifiable {
    var id = UUID()
    let user: MockSignInResponse
    let content: String
}
