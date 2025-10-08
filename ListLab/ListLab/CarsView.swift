//
//  CarsView.swift
//  ListLab
//
//  Created by Masimo Stephenson on 10/7/25.
//

import SwiftUI

struct Car: Identifiable {
    let id = UUID()
    var make: String
    var model: String
    var miles: Int
    var year: Int
    
    mutating func submit(make: String, model: String,
                miles: Int, year: Int) {
        self.make = make
        self.miles = miles
        self.model = model
        self.year = year
    }
}



struct CarsView: View {
    @State var cars = [
        Car(make: "Toyota", model: "Prius", miles: 22000, year: 2020),
        Car(make: "Honda", model: "Pilot", miles: 20000, year: 2017),
        Car(make: "Subaru", model: "Crosstrek", miles: 2000, year: 2015),
        Car(make: "Hyundai", model: "Elantra", miles: 15000, year: 2022)
    ]
    
//    let carCount = cars.count
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(
                    colors: [.blue, .black],
                    center: .topLeading,
                    startRadius: 20,
                    endRadius: 900
                ).ignoresSafeArea()
                
                HStack {
                    
                    ScrollView {
                        HStack {
                            VStack {
                                ForEach($cars) { $car in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20).frame(
                                            width: 200,
                                            height: 200
                                        ).foregroundStyle(
                                            LinearGradient(
                                                colors: [.blue, .black],
                                                startPoint: .trailing,
                                                endPoint: .leading
                                            )
                                        )
                                        VStack {
                                            Text("\(car.make) \(car.model)")
                                                .font(
                                                    .headline.weight(.heavy)
                                                    .pointSize(20)
                                                )
                                                .foregroundStyle(.white)
                                            
                                            NavigationLink(
                                                "Click for more details",
                                                destination: DetailsView(carDetail: $car)
                                            )
                                            .fontDesign(.serif).foregroundStyle(
                                                .white.secondary
                                            )
                                            .offset(y: 20)
                                            
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    VStack(alignment: .leading) {
                        NavigationLink {
                            NewCarView(carList: $cars)
                        } label: {
                            Image(systemName: "plus").frame(width: 40, height: 40).foregroundStyle(.white).glassEffect()
                        }
                        Spacer()
                    }.padding(.horizontal, 50)
                }
            }
        }
    }
}

#Preview {
    CarsView()
}
