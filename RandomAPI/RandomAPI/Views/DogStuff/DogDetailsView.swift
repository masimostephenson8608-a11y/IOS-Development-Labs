//
//  DogDetailsView.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/21/25.
//

import SwiftUI

struct DogDetailsView: View {
    @Binding var dog: Dog
    @State var newDogName = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if let url = URL(string: dog.message) {
            AsyncImage(url: url)
                .frame(maxWidth: 500, maxHeight: 500)
        } else {
            Text("No Image Found")
                .font(.largeTitle)
        }
        
        Divider()
        
        TextField(dog.name ?? "NO NAME", text: $newDogName) {
            dog.name = newDogName
            dismiss()
        }
    }
}
