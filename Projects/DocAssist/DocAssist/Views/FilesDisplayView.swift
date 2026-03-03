//
//  FilesDisplayView.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 3/3/26.
//

import SwiftUI

struct FilesDisplayView: View {
    var documents: [Document]
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 50, maximum: 200)),
        GridItem(.flexible(minimum: 50, maximum: 200)),
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(documents, id: \.fileHash) { doc in
                    NavigationLink {
                            PDFKitView(url: URL(filePath: doc.filePath))
                    } label: {
                        FileCellView(document: doc)
                            .frame(maxWidth: 150, maxHeight: 100)
                            .padding()
                    }
                }
            }
            Spacer()
        }
    }
}
