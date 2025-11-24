//
//  DogApiView.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/20/25.
//

import SwiftUI

struct DogApiView: View {
    @State var url: URL? = nil
    @State var dog: Dog? = nil
    @State var viewModel: DogViewModel
    
    var body: some View {
        NavigationStack {
            //            VStack {
            //                if !viewModel.dogs.isEmpty {
            //                    List(viewModel.dogs, id: \.self) { dog in
            //                        Text("\(dog.name ?? "No Name")")
            //                    }
            //                }
            //            }
            VStack {
                Text("Random Dog:")
                    .font(.largeTitle)
                
                if let url {
                    AsyncImage(url: url) {image in
                        image
                            .image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 500, maxHeight: 500)
                    }
                        
                } else {
                    Text("No Image Found")
                        .font(.largeTitle)
                }
                
                HStack {
                    Spacer()
                    Rectangle().frame(width: 100, height: 1).hidden()
                    TextField("Name", text: $viewModel.dogName) {
                        if var dog {
                            dog.name = viewModel.dogName
                            viewModel.dogName = ""
                            viewModel.dogs.append(dog)
                            Task {
                                await loadDogs()
                            }
                        }
                    }
                }
                
                Button {
                    Task {
                        await loadDogs()
                    }
                } label: {
                    Text("Refresh")
                }
            }
            
            .onAppear {
                Task {
                    await loadDogs()
                }
            }
            .toolbar {
                NavigationLink("List", destination: DogListView(viewModel: viewModel))
            }
        }
    }
    func loadDogs() async {
        do {
            dog = try await viewModel.api.getDogData()
            if let dog {
                url = URL(string: dog.message)
            }
        } catch {
            print("loadDogs() failed")
        }
    }
}
