//
//  ContentView.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/20/26.
//

import SwiftUI
import SwiftData
internal import UniformTypeIdentifiers
import PDFKit

struct ContentView: View {
    @State private var showPicker = false
    @State private var pickedFileURL: URL?
    
        var body: some View {
            GeometryReader { geometry in
                Button("Import Document") {
                    showPicker = true
                }.position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .fileImporter(
                    isPresented: $showPicker,
                    allowedContentTypes: [.pdf, .plainText],
                    allowsMultipleSelection: false
                ) { result in
                    switch result {
                    case .success(let urls):
                        let text = LocalParsingEngine.extractText(urls: urls)
                        print(text)
                        let (dates, emails, numbers) = ParsingAnalyst.extractAll(from: text)
                        print(dates, emails, numbers)
                        
                    case .failure(let error):
                        print("Picker failed: \(error)")
                    }
                }
            }
        }
}

#Preview {
    ContentView()
}
