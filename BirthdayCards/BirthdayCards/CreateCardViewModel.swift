//
//  CreateCardViewModel.swift
//  BirthdayCards
//
//  Created by Masimo Stephenson on 1/9/26.
//

import Foundation
import SwiftUI
import Observation
import PhotosUI

@Observable
class CreateCardViewModel {
    var description = ""
    var date = Date.now
    var backgroundColorRGB: RGBAColor?
    var textColor: RGBAColor?
    var selectedPhoto: PhotosPickerItem?
}
