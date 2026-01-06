//
//  ItemClass.swift
//  GeometryLab
//
//  Created by Masimo Stephenson on 1/6/26.
//

import Foundation

struct Item: Hashable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    
    static let items = [
        Item(image: "dog.fill", title: "First", description: "I dont wanna"),
        Item(image: "dog.fill", title: "Second", description: "noooo"),
        Item(image: "dog.fill", title: "Third", description: "descriptions are"),
        Item(image: "dog.fill", title: "Fourth", description: "A lot of work"),
        Item(image: "dog.fill", title: "Fifth", description: "Why is this"),
        Item(image: "dog.fill", title: "Sixth", description: "required?"),
        Item(image: "dog.fill", title: "Seventh", description: ""),
        Item(image: "dog.fill", title: "Eighth", description: ""),
        Item(image: "dog.fill", title: "Ninth", description: "")
    ]
}
