//
//  ViewModels.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/20/25.
//

import Foundation
import Observation

@Observable
class DogViewModel {
    let api: DogAPI
    var dogName = ""
    var dogs: [Dog] = []
    
    init(api: DogAPI) {
        self.api = api
    }
}
