//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Jane Madsen on 10/30/25.
//

import Foundation

struct Emoji: Codable, Identifiable {
    var id: UUID = UUID()
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedEmoji = try? propertyListEncoder.encode(emojis)
        try? encodedEmoji?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji] {
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedEmojiData = try? Data(contentsOf: archiveURL),
           let decodedEmoji = try? propertyListDecoder.decode([Emoji].self, from: retrievedEmojiData) else {
            print("Failed to decode")
            return []
        }
        return decodedEmoji
    }
    
    static var sampleEmojis = [
        Emoji(symbol: "😘", name: "Kiss", description: "Kiss with hearts", usage: "Show love"),
        Emoji(symbol: "💀", name: "Skull", description: "Dead or Skeleton", usage: "To make a visual respresentation of your expression of 'bruh"),
        Emoji(symbol: "😳", name: "Blushing", description: "The user is blushing", usage: "To show that you're blushing.")
    ]
}
