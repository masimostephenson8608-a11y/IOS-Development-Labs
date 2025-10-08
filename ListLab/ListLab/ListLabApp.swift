//
//  ListLabApp.swift
//  ListLab
//
//  Created by Masimo Stephenson on 10/7/25.
//

import SwiftUI

let someFormat: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .none
    formatter.zeroSymbol = ""
    return formatter
}()

@main
struct ListLabApp: App {
    var body: some Scene {
        WindowGroup {
            CarsView()
        }
    }
}
