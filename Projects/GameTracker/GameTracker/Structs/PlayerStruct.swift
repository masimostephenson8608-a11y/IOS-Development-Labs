//
//  PlayerStruct.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Player: Identifiable {
    @Attribute var id: UUID = UUID()
    
    @Attribute var name: String
    
    @Attribute var color: String
    
    @Attribute var points: Int
    
    @Relationship var game: Game?

    init(id: UUID = UUID(), name: String, color: String, points: Int) {
        self.id = id
        self.name = name
        self.color = color
        self.points = points
    }
}
