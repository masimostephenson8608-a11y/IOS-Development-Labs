//
//  SpaceshipScreen.swift
//  State Spaceship (aka Stateship)
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI
import Observation

@Observable class ShipComputer {
    var availablePower = 10
    var heading = ""
}

struct SpaceshipScreen: View {
    @State var shipCom = ShipComputer()
    @State var inChair: Bool = false
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation()
            }
            
            Section("Weapons Station") {
                WeaponsStation()
            }
            
            Section("Shield Station") {
                ShieldStation()
            }
            
            Section("Engine Station") {
                EngineStation()
            }
            
            Text("Available Power: \(shipCom.availablePower)")

        }
        .environment(shipCom)
        .padding()
    }
}

struct HelmStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @Bindable var shipComputer1 = ShipComputer()
    @State var inChair: Bool = false

    

    var body: some View {
        var crewMember = CrewChair(crewMember: .dog, inChair: $inChair)

        HStack {
            crewMember
            
            TextField("Heading", text: $shipComputer1.heading).disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State var isOn = false
    @State var firingPower = 0
    @State var inChair: Bool = false



    var body: some View {
        var crewMemeber = CrewChair(crewMember: .cat, inChair: $inChair)

        HStack {
            crewMemeber
            
            VStack {
                Toggle("Weapons Power: \(firingPower)", isOn: $isOn)
                    .disabled(!inChair)
                    .onChange(of: isOn) {
                                if shipComputer.availablePower <= 2 {
                                    return
                                }
                                if isOn == true {
                                    if shipComputer.availablePower >= 3 {
                                        firingPower += 3
                                        shipComputer.availablePower -= 3
                                    }
                                } else if isOn == false {
                                    firingPower -= 3
                                    shipComputer.availablePower += 3
                                }
                            
                                
//                                Add logic to remove/add 3 power to the system when enabled/disabled
                            }
                Button {
                    if isOn == true && shipComputer.availablePower > 2 {
                        isOn = false
                        shipComputer.availablePower -= 3
                        print("PEW!")
                    }
                } label: {
                    Text("Fire!")
                }.disabled(!inChair)
                
            }
        }
    }
}

struct ShieldStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State var shieldPower = 0
    @State var inChair: Bool = false

    var disable: Bool {
        shipComputer.availablePower > 0
    }
    
    var body: some View {
        HStack {
            CrewChair(crewMember: .lizard, inChair: $inChair)
            
//            Stepper("Shield Power: \(shieldPower)", value: $shieldPower, in: 0...10)
            Stepper {
                Text("Shield Power: \(shieldPower)")
            } onIncrement: {
                if disable {
                    shieldPower += 1
                    shipComputer.availablePower -= 1
                }
            } onDecrement: {
                if shieldPower > 0 {
                    shieldPower -= 1
                    shipComputer.availablePower += 1
                }
            }.disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State var enginePower = 0
    @State var inChair: Bool = false

    var body: some View {
        HStack {
            CrewChair(crewMember: .hare, inChair: $inChair)
            Stepper {
                Text("Engine Power: \(enginePower)")
            } onIncrement: {
                if shipComputer.availablePower > 0 {
                    enginePower += 1
                    shipComputer.availablePower -= 1
                }
            } onDecrement: {
                if enginePower > 0 {
                    enginePower -= 1
                    shipComputer.availablePower += 1
                }
            }.disabled(!inChair)

        }
    }
}

struct CrewChair: View {
    @Environment(ShipComputer.self) var shipComputer
    var crewMember: Crew
    @Binding var inChair: Bool
    
    var body: some View {
        Button {
            inChair.toggle()
        } label: {
            if inChair {
                crewMember.icon
            } else {
                Image(systemName: "person.slash")
            }
        }.buttonStyle(.plain)
        .padding(5)
        .background {
            Circle()
                .foregroundStyle(.gray)
        }
    }
}

enum Crew: String {
    case dog
    case cat
    case lizard
    case hare
    
    var icon: Image {
        switch self {
        case .dog:
            Image(systemName: "dog")
        case .cat:
            Image(systemName: "cat")
        case .lizard:
            Image(systemName: "lizard")
        case .hare:
            Image(systemName: "hare")
        }
    }
}

#Preview {
    SpaceshipScreen()
}
