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
    var id = UUID()
    var name: String
    
    var color: String
    
    var points: Int
    var game: Game?
    
    init(id: UUID = UUID(), name: String, color: String, points: Int) {
        self.id = id
        self.name = name
        self.color = color
        self.points = points
    }
}
