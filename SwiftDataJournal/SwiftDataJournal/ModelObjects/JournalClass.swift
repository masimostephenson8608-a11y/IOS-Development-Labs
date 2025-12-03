//
//  JournalClass.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/3/25.
//

import Foundation
import SwiftData

@Model
class Journal {
    var id = UUID()
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \JournalEntry.journal)
    var entries: [JournalEntry]
    var createdAt: Date
    
    init(id: UUID = UUID(), name: String, entries: [JournalEntry], createdAt: Date = .now) {
        self.id = id
        self.name = name
        self.entries = entries
        self.createdAt = createdAt
    }
}
