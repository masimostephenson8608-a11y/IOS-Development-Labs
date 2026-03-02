//
//  DocumentStruct.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/27/26.
//

import Foundation
import SwiftData

@Model
class Document {
    var displayName: String
    var fileId: UUID
    var filePath: String
    var createdAt: Date
    var modifiedAt: Date
    var extractedDates: [String]
    var confirmedImportantDates: [String]
    var entities: [String]
    var documentType: String
    var summaryShort: String
    var summaryDetailed: String
    var actionableItems: [String]
    var semanticTags: [String]
    var relevanceScore: Double
    //    var embeddings_vector: [Float]
    var aiProcessedAt: Date?
    var text: String
    var emails: [String]
    var phoneNumbers: [String]
    var category: String
    @Attribute(.unique) var fileHash: String // Unique File Hash
    
    init(displayName: String,fileId: UUID, filePath: String, createdAt: Date, modifiedAt: Date, extractedDates: [String], confirmedImportantDates: [String], entities: [String], documentType: String, summaryShort: String, summaryDetailed: String, actionableItems: [String], semanticTags: [String], relevanceScore: Double, aiProcessedAt: Date? = nil, text: String, emails: [String], phoneNumbers: [String], category: String, fileHash: String) {
        self.displayName = displayName
        self.fileId = fileId
        self.filePath = filePath
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.extractedDates = extractedDates
        self.confirmedImportantDates = confirmedImportantDates
        self.entities = entities
        self.documentType = documentType
        self.summaryShort = summaryShort
        self.summaryDetailed = summaryDetailed
        self.actionableItems = actionableItems
        self.semanticTags = semanticTags
        self.relevanceScore = relevanceScore
        self.aiProcessedAt = aiProcessedAt
        self.text = text
        self.emails = emails
        self.phoneNumbers = phoneNumbers
        self.category = category
        self.fileHash = fileHash
        #warning("Add embedding vector later")
    }
}
