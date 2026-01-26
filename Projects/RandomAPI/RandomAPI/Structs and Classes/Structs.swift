//
//  Structs.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/20/25.
//

import Foundation

struct Dog: Codable, Hashable, Identifiable {
    var id = UUID()
    let message: String
    let status: String
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case message
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        message = try container.decode(String.self, forKey: .message)
        status = try container.decode(String.self, forKey: .status)
        
        id = UUID()
        name = nil
    }
    
    init(name: String, message: String, status: String) {
        self.name = name
        self.message = message
        self.status = status
        self.id = UUID()
    }
}

struct Results: Codable {
    let results: [Representative]
}

struct Representative: Codable, Identifiable, Equatable {
    var id: String {
        return name
    }
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    
}
