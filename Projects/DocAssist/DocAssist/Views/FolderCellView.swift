//
//  FolderCellView.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 3/3/26.
//

import SwiftUI

struct FolderCellView: View {
    var category: String
    
    var body: some View {
        HStack {
            Image(systemName: "folder.fill")
                .font(.caption)
                .padding([.leading, .top, .bottom], 15)
            Text(category)
                .font(.callout.bold())
                .padding([.trailing, .top, .bottom], 15)
        }.frame(minWidth: 100, idealWidth: 150, maxWidth: 250, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .center)
        .glassEffect(.regular.tint(.gray))
    }
}

#Preview {
    FolderCellView(category: "Insurance")
}
