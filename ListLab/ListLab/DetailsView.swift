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
    
    let someFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol = ""
        return formatter
    }()
    var body: some View {
        Form {
            Section(header: Text("Car Information")) {
                TextField("\(carDetail.make)", text: $makeChange)
                TextField("\(carDetail.model)", text: $modelChange)
                TextField("\(carDetail.miles, format: .number)", value: $milesChange, formatter: someFormat )
                    .keyboardType(.numberPad)
                TextField("\(carDetail.year, format: .number)", value: $yearChange, formatter: someFormat)
                    .keyboardType(.numberPad)
            }
        }
    }
}

//#Preview {
//    DetailsView(carDetail: Car)
//}
