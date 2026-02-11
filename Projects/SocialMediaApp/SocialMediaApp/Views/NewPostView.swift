//
//  NewPostView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/16/25.
//

import SwiftUI
import Foundation

struct NewPostView: View {
    @State var viewModel: NewPostViewModel
    @Environment(\.dismiss) var dismiss
    @Binding var shouldRefresh: Bool
    @State var title = ""
    @State var postBody = ""
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView().ignoresSafeArea()
                VStack(alignment: .center) {
                    TextField("Title", text: $title)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .frame(width: 250)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.white.tertiary))
                    
                    Spacer()
                        .frame(maxHeight: 30)
                    
                    TextEditor(text: $postBody)
                        .textEditorStyle(.plain)
                        .font(.title2)
                        .frame(width: 250, height: 100)
                        .padding(15)
                        .background(RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.white.tertiary))
                    
                    
                        .navigationTitle("New Post")
                        .navigationBarTitleDisplayMode(.inline)
                    
                    Button {
                        viewModel.title = title
                        viewModel.body = postBody
                        if viewModel.title.isEmpty || viewModel.body.isEmpty {
                            return
                        }
                        viewModel.makeNewPost()
                        dismiss()
                    } label: {
                        Text("Submit")
                    }
                }
                .padding(20)
            }
        }
        .onChange(of: viewModel.shouldRefresh) {
            shouldRefresh = true
        }
    }
}
