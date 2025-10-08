//
//  NewCarView.swift
//  ListLab
//
//  Created by Masimo Stephenson on 10/8/25.
//

import SwiftUI

struct NewCarView: View {
    @Binding var carList: [Car]
    @State private var make = ""
    @State private var model = ""
    @State private var miles = 0
    @State private var year = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [.blue, .black],
                center: .topLeading,
                startRadius: 20,
                endRadius: 900
            ).ignoresSafeArea()
            VStack {
                List {
                    Section(header: Text("New Car")) {
                        TextField("Make", text: $make)
                        TextField("Model", text: $model)
                        TextField("Miles", value: $miles, formatter: someFormat)
                            .keyboardType(.numberPad)
                        TextField("Year", value: $year, formatter: someFormat)
                            .keyboardType(.numberPad)
                    }
                    
                }.scrollContentBackground(.hidden)
                
                Spacer()
                Button {
                    carList.append(Car(make: make, model: model, miles: miles, year: year))
                } label: {
                    Text("Add Car").foregroundStyle(Color(white: 0.5)).padding(.vertical, 50)
                }
            }
        }
    }
}

//#Preview {
//    NewCarView(cars)
//}
