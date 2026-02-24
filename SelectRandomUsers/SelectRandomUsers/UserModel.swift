//
//  UserModel.swift
//  SelectRandomUsers
//
//  Created by Masimo Stephenson on 2/24/26.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    var id = UUID()
    var name: String
    var selected = false
    
    init(name: String, selected: Bool = false) {
        self.name = name
        self.selected = selected
    }
}
