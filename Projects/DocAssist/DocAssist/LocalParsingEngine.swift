//
//  LocalParsingEngine.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/20/26.
//

import Foundation
import PDFKit
import CryptoKit
import SwiftData

struct LocalParsingEngine {
    enum ParsingEngineErrors: Error {
        case cantGetUrl
    }
    
    static func hashURL(url: URL) throws -> String {
        let data: Data
        do {
           data = try Data(contentsOf: url)
        } catch {
            throw error
        }
        let fileHash = SHA256.hash(data: data)
        let stringified = fileHash.map {String(format: "%02x", $0)}.joined()
        return stringified
    }
    
    static func hasDuplicates(url: URL, modelContext: ModelContext) throws -> Bool {
        //Setup to just do the first element of the URLS array
//        guard let url = urls.first else { throw ParsingEngineErrors.cantGetUrl }
        let fileHash: String
        do {
            fileHash = try self.hashURL(url: url)
        } catch {
            throw error
        }
        
        let predicate = #Predicate<Document> { $0.fileHash == fileHash }
        var descriptor = FetchDescriptor(predicate: predicate)
        
        if let newHash = try? modelContext.fetch(descriptor) {
            if newHash.isEmpty {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
    static func extractText(url: URL) -> String {
        
        //Setup to just do the first element of the URLS array
        var strings: [String] = []
//        guard let url = urls.first else { return "" }
        let didAccess = url.startAccessingSecurityScopedResource()
        print("Can access file: \(didAccess)")
        print("File name: \(url.lastPathComponent)")
        guard let document = PDFDocument(url: url) else { return "" }
        for count in 0..<document.pageCount {
            if let page = document.page(at: count) {
                if let string = page.string {
                    strings.append(string)
                }
            }
        }
        url.stopAccessingSecurityScopedResource()
        return strings.joined(separator: "\n")
    }
}
