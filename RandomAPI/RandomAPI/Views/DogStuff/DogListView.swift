//
//  DogListView.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/21/25.
//

import SwiftUI

struct DogListView: View {
    @State var viewModel: DogViewModel
    @State var presentSheet = false
    @State var selectedDog: Dog? = nil
    
    var body: some View {
        NavigationStack {
            if !viewModel.dogs.isEmpty {
                ForEach(viewModel.dogs) { dog in
                    if let name = dog.name {
                        ZStack {
//                            Rectangle().frame(width: 100, height: 100)
//                                .foregroundStyle(.black)
                            if let url = URL(string: dog.message) {
                                Button {
                                    selectedDog = dog
                                    presentSheet.toggle()
                                } label: {
                                    AsyncImage(url: url) {image in
                                        image
                                            .image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 100, maxHeight: 100)
                                    }
                                    Text(name)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                    }
                }
            }
            Divider()
            .navigationTitle("Dog List")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $presentSheet) {
                if let dog = selectedDog {
                    if let index = viewModel.dogs.firstIndex(where: {$0.id == dog.id}) {
                        DogDetailsView(dog: $viewModel.dogs[index])
                    }
                }
            }
        }
    }
}

#Preview {
    DogListView(viewModel: DogViewModel(api: DogAPI()))
}

