//
//  LocalParsingEngine.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/20/26.
//

import Foundation
import PDFKit

struct LocalParsingEngine {
    
    static func extractText(urls: [URL]) -> String {
        var strings: [String] = []
        guard let url = urls.first else { return "" }
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
