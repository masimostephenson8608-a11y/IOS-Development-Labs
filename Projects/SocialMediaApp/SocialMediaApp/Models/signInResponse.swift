//
//  signInResponse.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI

struct signInResponse: Codable {
    /*
     "email": "",
     "userUUID": "",
     "firstName": "",
     "lastName": "",
     "secret": "",
     "userName": ""
     */
    
     let email: String
     let userUUID: String
     let firstName: String
     let lastName: String
     let secret: String
     let userName: String
}
