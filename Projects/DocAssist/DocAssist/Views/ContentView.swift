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
import CryptoKit

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var showPicker = false
    @State private var pickedFileURL: URL?
    @State var selectedPreDoc: PreDocument? = nil
    @State var showEditFileScreen = false
    
        var body: some View {
            GeometryReader { geometry in
                NavigationStack {
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
                                for url in urls {
                                    createDocument(url: url)
                                }
                                
                                
                            case .failure(let error):
                                print("Picker failed: \(error)")
                        }
                    }
                    
                        .onChange(of: selectedPreDoc) {
                            _, newValue in
                            if newValue != nil {
                                showEditFileScreen = true
                            }
                        }
                        .sheet(isPresented: $showEditFileScreen) {
                            if let preDoc = selectedPreDoc {
                                EditFileView(preDoc: preDoc)
                                    .presentationDetents([.medium])
                            }
                        }
                }
            }
        }
    func createDocument(url: URL) {
        do {
            let text = LocalParsingEngine.extractText(url: url)
            print(text)
            let (dates, emails, numbers) = ParsingAnalyst.extractAll(from: text)
            
            if try LocalParsingEngine.hasDuplicates(url: url, modelContext: context) == true {
                return
        } else {
                let attributes = try! FileManager.default.attributesOfItem(atPath: url.path())
                let createDate = attributes[FileAttributeKey.creationDate] as! Date
                
            selectedPreDoc = PreDocument(displayName: url.lastPathComponent,fileId: UUID(), filePath: url.path(),
                                        createdAt: createDate, modifiedAt: Date.now,
                                        extractedDates: dates,
                                        confirmedImportantDates: [],
                                        entities: [], documentType: url.pathExtension,
                                        summaryShort: "", summaryDetailed: "",
                                        actionableItems: [], semanticTags: [],
                                        relevanceScore: 0.0, text: text,
                                        emails: emails, phoneNumbers: numbers,
                                        category: "None", fileHash: try LocalParsingEngine.hashURL(url: url))
            }
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
