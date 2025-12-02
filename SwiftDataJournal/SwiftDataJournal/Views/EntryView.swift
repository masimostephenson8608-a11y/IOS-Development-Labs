//
//  EntryView.swift
//  SwiftDataJournal
//
//  Created by Masimo Stephenson on 12/2/25.
//

import SwiftUI

struct EntryView: View {
    var entry: JournalEntry
    
    var body: some View {
        VStack {
            Text("\(entry.name)")
                .font(.largeTitle)
                .padding(25)
            Divider()
            let displayDate = entry.createdAt.formatted(date: .long, time: .shortened)
            Text("Created at: \(displayDate)")
                .font(.caption)
                .padding(10)
            Divider()
            Text("\(entry.text)")
                .font(.title)
                .lineLimit(10)
                .fixedSize(horizontal: false, vertical: true)
                .padding(25)
            Spacer()
        }.padding(.horizontal, 25)
    }
}
