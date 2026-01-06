//
//  ContentView.swift
//  GeometryLab
//
//  Created by Masimo Stephenson on 1/6/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalClass
//    @State var columnCount = 2
    var items = Item.items
    var columnCount: Int {
        if horizontalClass == .compact {
            return 2
        } else {
            return 3
        }
    }
    var rowCount: Int {
        Int(roundl((Double(items.count) / Double(columnCount))))
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                ForEach(0 ..< rowCount, id: \.self) { row in
                    HStack {
                        ForEach(0 ..< columnCount, id: \.self) { column in
                            
                            let index = row * columnCount + column
                            
                            if index < items.count {
                                let item = items[index]
                                
                                VStack {
                                    Text(item.title)
                                    Text(item.description).font(.footnote)
                                    Image(systemName: item.image)
                                }
                                .frame(width: geometry.size.width / CGFloat(columnCount),
                                       height: geometry.size.height / CGFloat(rowCount))
                                .background(.secondary)
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
