//
//  EditFileView.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 3/2/26.
//

import SwiftUI
import SwiftData

struct EditFileView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    let storeCategory: StoreCategory
    @State var categories: [String]
    @State var selectedCategory: String
    @State var preDoc: PreDocument
    @State var otherTrue = false
    @State var otherCategory: String = ""
    
    init(preDoc: PreDocument) {
        self.storeCategory = StoreCategory()
        self.preDoc = preDoc
        self.categories = storeCategory.categories
        self.selectedCategory = preDoc.category
    }
    
    var body: some View {
        VStack {
            TextField(preDoc.displayName, text: $preDoc.displayName)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                
            Spacer()
                .frame(maxHeight: 150)
            
            HStack {
                Text("Category:")
                
                pickerView
                //PLACE PICKER
            }
            .padding()
            
            if selectedCategory == "Other" {
                TextField("Category", text: $otherCategory)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Button("Save") {
                //Save File
                saveDocument()
            }
        }
    }
    
    //MARK: Picker View
    var pickerView: some View {
        Picker("Category", selection: $selectedCategory) {
            ForEach(categories, id: \.self) { text in
                Text(text)
                    .tag(text)
            }
            Text("Other")
                .tag("Other")
        }
    }
    
    //MARK: Save Function
    func saveDocument() {
        let doc = Document(displayName: preDoc.displayName,
                           fileId: preDoc.fileId,
                           filePath: preDoc.filePath,
                           createdAt: preDoc.createdAt,
                           modifiedAt: preDoc.modifiedAt,
                           extractedDates: preDoc.extractedDates,
                           confirmedImportantDates: preDoc.confirmedImportantDates,
                           entities: preDoc.entities,
                           documentType: preDoc.documentType,
                           summaryShort: preDoc.summaryShort,
                           summaryDetailed: preDoc.summaryDetailed,
                           actionableItems: preDoc.actionableItems,
                           semanticTags: preDoc.semanticTags,
                           relevanceScore: preDoc.relevanceScore,
                           text: preDoc.text,
                           emails: preDoc.emails,
                           phoneNumbers: preDoc.phoneNumbers,
                           category: preDoc.category,
                           fileHash: preDoc.fileHash)
        context.insert(doc)
        dismiss()
    }
    
}

#Preview {
    EditFileView(preDoc: mock)
}

var mock = PreDocument(
    displayName: "Sample Document.pdf",
    fileId: UUID(),
    filePath: "/Users/preview/Documents/Sample Document.pdf",
    createdAt: Date().addingTimeInterval(-86400),
    modifiedAt: Date(),
    extractedDates: ["2026-03-01", "2026-03-15"],
    confirmedImportantDates: ["2026-03-10"],
    entities: ["ACME Corp", "John Doe"],
    documentType: "pdf",
    summaryShort: "A short summary of the document.",
    summaryDetailed: "This is a longer, detailed summary of the sample document used for previews.",
    actionableItems: ["Follow up via email", "Schedule meeting"],
    semanticTags: ["invoice", "finance", "q1"],
    relevanceScore: 0.85,
    aiProcessedAt: nil,
    text: "This is placeholder extracted text for preview/testing.",
    emails: ["john.doe@example.com"],
    phoneNumbers: ["+1 (555) 123-4567"],
    category: "General",
    fileHash: "DEADBEEFCAFEBABE"
)
