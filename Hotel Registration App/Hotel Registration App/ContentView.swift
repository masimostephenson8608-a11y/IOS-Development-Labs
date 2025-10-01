//
//  ContentView.swift
//  Hotel Registration App
//
//  Created by Jane Madsen on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            HotelRegistrationScreen()
        }
    }
}

struct HotelRegistrationScreen: View {
    @State var Guests: [Guest] = []
    //MARK: Guest Struct
    struct Guest {
         var firstName: String
         var lastName: String
        var doorCode: String
         var numberOfGuests: Int
         var lengthOfStay: Int
         var nonSmoking: Bool
        
        init(firstName: String, lastName: String, doorCode: String, numberOfGuests: Int, lengthOfStay: Int, nonSmoking: Bool) {
            self.firstName = firstName
            self.lastName = lastName
            self.doorCode = doorCode
            self.numberOfGuests = numberOfGuests
            self.lengthOfStay = lengthOfStay
            self.nonSmoking = nonSmoking
        }
    }
    
    @State var firstName = ""
    @State var lastName = ""
    @State var doorCode = ""
    @State var numberOfGuests = 0
    @State var lengthOfStay = 0
    @State var nonSmoking = false
    @State var submitted = false
    @State var registrationFeedback = 0
    
    var body: some View {
        VStack {
            HStack {
                Image("mountainlandLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("Mountainland Inn")
                    .font(.custom("Verdana", size: 30))
                    .bold()
                    .foregroundStyle(Color.background)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.highlight)
                    }
            }
            
            Spacer()
           
            HStack {
                VStack {
                    TextField("First Name:", text: $firstName)
                        .background(Color.background)
                        .foregroundStyle(.text)
                        .tint(.highlight)
                        .padding()
                    TextField("Last Name:", text: $lastName)
                        .background(Color.background)
                        .foregroundStyle(.text)
                        .tint(.highlight)
                        .padding()
                    SecureField("Door Code:", text: $doorCode)
                        .background(Color.background)
                        .foregroundStyle(.text)
                        .tint(.highlight)
                        .padding()
                        .keyboardType(.numberPad)
                }
                .frame(maxWidth: 120)
                
                VStack(spacing: 20) {
                    Text("Number of Guests").font(.custom("Verdana", size: 15))
                    Picker("Number of Guests", selection: $numberOfGuests) {
                        ForEach(1...8, id: \.self) { num in
                            Text("\(num)")
                        }
                    }.pickerStyle(.segmented).glassEffect()
                    
                    HStack {
                        Stepper("Length of Stay", value: $lengthOfStay).font(.custom("Verdana", size: 15))
                        
                        Text("\(lengthOfStay)").font(.custom("Verdana", size: 15))
                    }
                    Toggle("Non-Smoking:", isOn: $nonSmoking)
                }.padding()
                
                
            }.frame(maxHeight: 275)
            
            if submitted == false {
                Button {
                    Guests.append(Guest(firstName: firstName, lastName: lastName, doorCode: doorCode, numberOfGuests: numberOfGuests, lengthOfStay: lengthOfStay, nonSmoking: nonSmoking))
                    submitted = true
                } label: {
                    Text("Submit").font(.custom("Rockwell", size: 25)).bold().foregroundStyle(.text).padding()
                }.frame(width: 175, height: 50).background(Capsule().foregroundStyle(.highlight))
            } else {
                Text("Rating:").font(.custom("Rockwell", size: 40))
                Picker("Rate", selection: $registrationFeedback) {
                    ForEach(1...5, id: \.self) {
                        num in Text("\(num)")
                    }
                }.pickerStyle(.wheel)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
