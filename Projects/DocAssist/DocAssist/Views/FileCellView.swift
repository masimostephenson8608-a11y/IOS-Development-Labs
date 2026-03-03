//
//  FileCellView.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 3/3/26.
//

import SwiftUI

struct FileCellView: View {
    var document: Document
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "document")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(document.displayName)
                .font(.footnote)
        }
    }
}
