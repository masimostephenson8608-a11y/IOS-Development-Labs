//
//  FilesDisplayView.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 2/27/26.
//

import SwiftUI
import SwiftData

struct FolderDisplayView: View {
    @Environment(\.modelContext) var context
    @Environment(StoreCategory.self) var storeCategory
    @Query(sort: [SortDescriptor(\Document.category), SortDescriptor(\Document.modifiedAt, order: .reverse)]) var documents: [Document]
    
    @State var selectedCategory: String? = nil
    @State var presentFiles = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if presentFiles == true {
                    FilesDisplayView(documents: getDocuments())
                        .transition(.slide.animation(.smooth))
                } else {
                    folderScreen.transition(.opacity.animation(.easeInOut(duration: 0.7)))
                }
                
                Rectangle().frame(width: 1, height: 1)
                    .hidden()
                .navigationTitle("Documents")
                .onChange(of: selectedCategory) { _, newValue in
                    if newValue != nil {
                        withAnimation {
                            presentFiles = true
                        }
                    }
                }
            }
            .toolbar {
                if presentFiles == true {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Back", systemImage: "chevron.left") {
                            withAnimation {
                                selectedCategory = nil
                                presentFiles = false
                            }
                        }
                    }
                }
            }
        }
    }
    
    var folderScreen: some View {
        ScrollView {
            VStack {
                ForEach(storeCategory.categories, id: \.self) { text in
                    Button {
                        withAnimation() {
                            selectedCategory = text
                        }
                    } label: {
                        FolderCellView(category: text)
                    }.foregroundStyle(.white)
                }
            }
        }
    }
    
    func getDocuments() -> [Document] {
        var documents: [Document] = []
        if let cat = selectedCategory {
            documents = self.documents.filter({$0.category.lowercased() == cat.lowercased()})
        }
        documents.sort(by: { $0.modifiedAt < $1.modifiedAt })
        return documents
    }
}

#Preview {
    FolderDisplayView()
}
