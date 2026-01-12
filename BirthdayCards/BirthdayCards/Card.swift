//
//  Card.swift
//  BirthdayCards
//
//  Created by Masimo Stephenson on 1/9/26.
//
import Foundation
import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    let description: String
    let date: Date
    let backgroundColorRGB: RGBAColor?
    let textColor: RGBAColor?
    let photo: UIImage
}

struct RGBAColor {
    let r: Float
    let g: Float
    let b: Float
    let opacity: Float
}
