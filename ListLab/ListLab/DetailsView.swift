//
//  DetailsView.swift
//  ListLab
//
//  Created by Masimo Stephenson on 10/7/25.
//

import SwiftUI

struct DetailsView: View {
    @Binding var carDetail: Car
    @State private var makeChange: String = ""
    @State private var modelChange: String = ""
    @State private var milesChange: Int = 0
    @State private var yearChange: Int = 0
    var ableToSubmit: Bool {
        if !makeChange.isEmpty && !modelChange.isEmpty
            && milesChange != carDetail.miles && yearChange != carDetail.year {
            return false
        } else {
            return true
        }
    }
    
   
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
            
            Section {
                Button(role: .confirm) {
                    carDetail.submit(make: makeChange,
                                     model: modelChange, miles: milesChange, year: yearChange)
                } label: {
                    Text("Confirm")
                }.disabled(ableToSubmit)
            }
        }.scrollContentBackground(.hidden)
            .background(RadialGradient(
                colors: [.blue, .black],
                center: .topLeading,
                startRadius: 20,
                endRadius: 900
            ).ignoresSafeArea())
        
        
    }
}

//#Preview {
//    DetailsView(carDetail: Car)
//}
