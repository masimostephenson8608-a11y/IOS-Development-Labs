//
//  PreDocumentModel.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 3/2/26.
//

import Foundation

struct PreDocument: Equatable {
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
    var fileHash: String // Unique File Hash
}
