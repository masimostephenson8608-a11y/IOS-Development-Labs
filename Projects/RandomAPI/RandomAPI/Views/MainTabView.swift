//
//  ContentView.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/20/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Dog", systemImage: "dog") {
                DogApiView(viewModel: DogViewModel(api: DogAPI()))
            }
            
            Tab("Rep", systemImage: "person.circle.fill") {
                RepresentativeApiView(apiController: RepresentativeApiController())
            }
        }
    }
}

#Preview {
    MainTabView()
}
