//
//  DetailsView.swift
//  ListLab
//
//  Created by Masimo Stephenson on 10/7/25.
//

import SwiftUI

struct DetailsView: View {
    let carDetail: Car
    @State private var makeChange: String = ""
    @State private var modelChange: String = ""
    @State private var milesChange: Int = 0
    @State private var yearChange: Int = 0
    var body: some View {
        Form {
            Section(header: Text("Car Information")) {
                TextField("\(carDetail.make)", text: $makeChange)
                TextField("\(carDetail.model)", text: $modelChange)
                TextField("\(carDetail.miles, format: .number)", value: $milesChange, format: .number )
                    .keyboardType(.numberPad)
                TextField("\(carDetail.year, format: .number)", value: $yearChange, format: .number)
                    .keyboardType(.numberPad)
            }
        }
    }
}

//#Preview {
//    DetailsView(carDetail: Car)
//}
