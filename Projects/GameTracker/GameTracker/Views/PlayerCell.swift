//
//  PlayerCell.swift
//  GameTracker
//
//  Created by Masimo Stephenson on 12/15/25.
//
import SwiftUI

struct PlayerCell: View {
    
    let game: Game
    
    var body: some View {
        HStack {
            Image(systemName: game.icon)
                .resizable()
                .frame(width: 25, height: 25)
            VStack {
                Text(game.title)
                    .font(.title.bold())
                HStack {
                    Text("Winning: ")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                    Text("\(game.winning?.name ?? "N/A")")
                        .font(.title3.bold())
                        .foregroundStyle(.black)
                }
            }
            Spacer()
        }
        .padding(10)
        .contentShape(Rectangle())
    }
    
}
