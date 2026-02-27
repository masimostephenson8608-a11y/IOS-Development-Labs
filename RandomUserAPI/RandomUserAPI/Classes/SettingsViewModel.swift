//
//  SettingsViewModel.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//

import Foundation
import Observation

@Observable
class SettingsViewModel {
    var resultCount = 1
    var showEmail = true
    var showBirthday = true
    var showAddress = true
    var phoneNumber = true
    var showPassword = true
    var showGender = true
    var showLocation = true
    var showCell = true
    var showNat = true
    
    init(resultCount: Int = 1, showEmail: Bool = true, showBirthday: Bool = true,
         showAddress: Bool = true, phoneNumber: Bool = true,
         showPassword: Bool = true, showGender: Bool = true, showLocation: Bool = true, showCell: Bool = true, showNat: Bool = true) {
        self.resultCount = resultCount
        self.showEmail = showEmail
        self.showBirthday = showBirthday
        self.showAddress = showAddress
        self.phoneNumber = phoneNumber
        self.showPassword = showPassword
        self.showGender = showGender
        self.showLocation = showLocation
        self.showCell = showCell
        self.showNat = showNat
    }
}
