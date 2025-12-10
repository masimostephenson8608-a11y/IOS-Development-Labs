//
//  PlayerStruct.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import Foundation

struct Player: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var points: Int
}
