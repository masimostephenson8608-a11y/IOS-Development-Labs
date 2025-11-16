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
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                TextField("Picture URL", text: $viewModel.picture)
                    .navigationTitle("New Post")
                    .navigationBarTitleDisplayMode(.inline)
                
                Button {
                    viewModel.makeNewPost()
                    dismiss()
                } label: {
                    Text("Submit")
                }
            }
            .padding(20)
        }
    }
}
