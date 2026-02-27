//
//  SettingsView.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var settings: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section("How many users would you like?") {
                    resultStepper
                }
                
                Section("What would you like to show?") {
                //MARK: Email
                    HStack {
                        Text("Email:")
                        
                        Spacer()
                        
                        Picker("Email", selection: $settings.showEmail) {
                            Text("Show")
                                .tag(true)
                            Text("Hide")
                                .tag(false)
                        }.pickerStyle(.segmented)
                            .frame(maxWidth: 200)
                    }
                    
                    //MARK: Birthday
                        HStack {
                            Text("Birthday:")
                            
                            Spacer()
                            
                            Picker("Birthday", selection: $settings.showBirthday) {
                                Text("Show")
                                    .tag(true)
                                Text("Hide")
                                    .tag(false)
                            }.pickerStyle(.segmented)
                                .frame(maxWidth: 200)
                        }
                    
                    //MARK: Address
                        HStack {
                            Text("Address:")
                            
                            Spacer()
                            
                            Picker("Address", selection: $settings.showAddress) {
                                Text("Show")
                                    .tag(true)
                                Text("Hide")
                                    .tag(false)
                            }.pickerStyle(.segmented)
                                .frame(maxWidth: 200)
                        }
                    
                    //MARK: Number
                        HStack {
                            Text("Number:")
                            
                            Spacer()
                            
                            Picker("Number", selection: $settings.showCell) {
                                Text("Show")
                                    .tag(true)
                                Text("Hide")
                                    .tag(false)
                            }.pickerStyle(.segmented)
                                .frame(maxWidth: 200)
                        }
                    
                    //MARK: Password
                        HStack {
                            Text("Password:")
                            
                            Spacer()
                            
                            Picker("Password", selection: $settings.showPassword) {
                                Text("Show")
                                    .tag(true)
                                Text("Hide")
                                    .tag(false)
                            }.pickerStyle(.segmented)
                                .frame(maxWidth: 200)
                        }
                    
                    //MARK: Gender
                        HStack {
                            Text("Gender:")
                            
                            Spacer()
                            
                            Picker("Gender", selection: $settings.showGender) {
                                Text("Show")
                                    .tag(true)
                                Text("Hide")
                                    .tag(false)
                            }.pickerStyle(.segmented)
                                .frame(maxWidth: 200)
                        }
                    
                    //MARK: Location
                        HStack {
                            Text("Location:")
                            
                            Spacer()
                            
                            Picker("Location", selection: $settings.showLocation) {
                                Text("Show")
                                    .tag(true)
                                Text("Hide")
                                    .tag(false)
                            }.pickerStyle(.segmented)
                                .frame(maxWidth: 200)
                        }
                    
                    //MARK: Nationality
                        HStack {
                            Text("Nationality:")
                            
                            Spacer()
                            
                            Picker("Nationlity", selection: $settings.showNat) {
                                Text("Show")
                                    .tag(true)
                                Text("Hide")
                                    .tag(false)
                            }.pickerStyle(.segmented)
                                .frame(maxWidth: 200)
                        }
                }
            }
        }
        /*
        showPassword
        showGender
        showLocation
        showNat
         */
    }
    
    //MARK: Result Stepper View
    var resultStepper: some View {
        Stepper("Result Count: \(settings.resultCount)", onIncrement: {
            settings.resultCount += 1
        }, onDecrement: {
            if settings.resultCount > 0 {
                settings.resultCount -= 1
            }
        })
    }
}
