//
//  NewGameView.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/10/25.
//

import SwiftUI
import SwiftData

enum customColor: String {
    case red
    case black
    case green
}

struct NewGameView: View {
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    @State var players: [Player] = []
    @State var sortedBy: Game.SortBy = .highest
    @State var whoWins: Game.SortBy = .highest
    @State var playerName: String = ""
    @State var playerColor: String = "black"
    var displayColor: Color {
        switch playerColor {
        case "red":
            return Color.red
        case "green":
            return Color.green
        case "black":
            return Color.black
        default:
            return Color.black
        }
    }
        
    @State var gameIcon: String = Icon.gameController.rawValue
    @Environment(\.modelContext) var context

    
    enum Icon: String {
        case gameController = "gamecontroller.circle.fill"
        case dice = "dice.fill"
        case joystick = "arcade.stick"
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: gameIcon)
                    .resizable()
                    .frame(width: 50, height: 50)
                
                TextField("Title", text: $title)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
            .padding(15)
            
            Picker("Icon", selection: $gameIcon) {
                Text("Game Controller")
                    .tag(Icon.gameController.rawValue)
                Text("Dice")
                    .tag(Icon.dice.rawValue)
                Text("Joystick")
                    .tag(Icon.joystick.rawValue)
            }
            .pickerStyle(.menu)
            
            Text("Players sorted by:")
            Picker("Sorted by:", selection: $sortedBy) {
                Text("Highest")
                    .tag(Game.SortBy.highest)
                Text("Lowest")
                    .tag(Game.SortBy.lowest)
            }.pickerStyle(.segmented)
                .frame(width: 150)
            
            Text("Player wins by:")
            Picker("Who wins:", selection: $whoWins) {
                Text("Highest")
                    .tag(Game.SortBy.highest)
                Text("Lowest")
                    .tag(Game.SortBy.lowest)
            }.pickerStyle(.segmented)
                .frame(width: 150)
            
            Spacer()
            
            Text("Players:")
            if !players.isEmpty {
                ForEach(players) { player in
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(getColor(player: player))
                        Text(player.name)
                    }
                }
            }
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "person.fill")
                    .foregroundStyle(displayColor)
                TextField("Player Name", text: $playerName)
                    .frame(maxWidth: 150)
                Picker("Color", selection: $playerColor) {
                    Text("Red")
                        .tag("red")
                    Text("Green")
                        .tag("green")
                    Text("Black")
                        .tag("black")
                }
                Spacer()
            }
            
            Button("Save Player") {
                savePlayer()
            }
            .toolbar {
                ToolbarItem() {
                    Button("Save") {
                        if !title.isEmpty && !players.isEmpty {
                            let newGame = Game(icon: gameIcon, title: title, players: players, sortBy: sortedBy, winBy: whoWins)
                            context.insert(newGame)
                            dismiss()
                        }
                    }
                }
            }
        }
        .padding(25)
    }
    func savePlayer() {
        if !playerName.isEmpty {
            players.append(Player(name: playerName, color: playerColor, points: 0))
        }
        playerName = ""
        playerColor = ""
    }
    
    func getColor(player: Player) -> Color {
        switch player.color {
            case "red":
                return Color.red
            case "green":
                return Color.green
            case "black":
                return Color.black
            default:
                return Color.black
        }

    }
}
