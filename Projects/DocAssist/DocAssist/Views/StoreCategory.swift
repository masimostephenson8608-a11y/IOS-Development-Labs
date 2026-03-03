//
//  StoreCategory.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 3/2/26.
//

import Foundation
import Observation

@Observable
class StoreCategory {
    let userDefaults = UserDefaults()
    var categories: [String] = []
    var key = "category"
    
    init() {
        if let categories = userDefaults.stringArray(forKey: key) {
            self.categories = categories
        }
    }
    
    func addCategory(_ category: String) {
        if !categories.contains(category) {
            categories.append(category)
            userDefaults.set(categories, forKey: key)
        }
    }
}
