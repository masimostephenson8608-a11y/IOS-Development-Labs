//
//  ParsingAnalyst.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/20/26.
//

import Foundation
import PDFKit

struct ParsingAnalyst {
    
    static func extractDates(from text: String) -> [String] {
        var matches: [String] = []

        let patterns = [
            /\d{1,2}\/\d{1,2}\/\d{2,4}/,
            /[A-Za-z]+\.?\s\d{1,2},\s\d{2,4}/
        ]
        
        for pattern in patterns {
            let patternMatches = text.matches(of: pattern)
            matches += patternMatches.map { match in
                String(text[match.range])
            }
        }
        return matches
    }
    
    static func extractEmail(from text: String) -> [String] {
        let pattern = /[A-Za-z0-9.]+@[a-z]+\.[a-z]+/

        let matches = text.matches(of: pattern)
        return matches.map { match in
            String(text[match.range])
        }

    }
    
    static func extractNumber(from text: String) -> [String] {
        var matches: [String] = []

        let patterns = [
            /\d{3} \d{3} \d{4}/,
            /\d{3}-\d{3}-\d{4}/,
            /\+1 \d{3}-\d{3}-\d{4}/,
            /\d{3} \d{3}-\d{4}/,
            /\d{3}\.\d{3}\.\d{4}/,
            /\d{10}/,
            /\+1-\d{3}-\d{3}-\d{4}/,
            /\+1 \d{3} \d{3} \d{4}/,
            /1-\d{3}-\d{3}-\d{4}/
        ]
        
        for pattern in patterns {
            let patternMatches = text.matches(of: pattern)
            matches += patternMatches.map { match in
                String(text[match.range])
            }
        }
        return matches
    }
    
    static func extractAll(from text: String) -> (dates: [String], emails: [String], numbers: [String]) {
        let dates = extractDates(from: text)
        let emails = extractEmail(from: text)
        let numbers = extractNumber(from: text)
        
        return (dates, emails, numbers)
    }
}
