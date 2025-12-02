//
//  JournalEntry.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/2/25.
//

import Foundation
import SwiftData

@Model
class JournalEntry {
    var id = UUID()
    var name: String
    var text: String
    var createdAt: Date
    
    init(name: String, text: String, createdAt: Date = .now) {
        self.name = name
        self.text = text
        self.createdAt = createdAt
    }
}
