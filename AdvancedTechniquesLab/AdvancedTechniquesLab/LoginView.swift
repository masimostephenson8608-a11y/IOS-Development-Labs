//
//  ContentView.swift
//  AdvancedTechniquesLab
//
//  Created by Masimo Stephenson on 1/5/26.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel = LoginViewModel()
    var body: some View {
        ZStack {
            Rectangle().foregroundStyle(.black).ignoresSafeArea()

            switch viewModel.loadingState {
            case .none:
                loginView
            case .loading:
                loadingScreen
            case .error:
                errorLoading
            case .success:
                successfulLoading
            }
        }
    }
    
    var loginView: some View {
        VStack {
            Text("Login")
                .font(.title.bold())
                .foregroundStyle(.white)
            
            Spacer()
            
            TextField("Username", text: $viewModel.username)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .modifier(textFieldModifier())
            
            SecureField("Password", text: $viewModel.password)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .modifier(textFieldModifier())
            
            Button("Login") {
                viewModel.loadingState = .loading
                Task {
                    await viewModel.loading()
                }
            }.buttonStyle(buttonModifier())
            
            Spacer()
        }
        .padding()
    }
    
    var loadingScreen: some View {
        ProgressView("Logging In", value: min(max(viewModel.loadingProgress, 0.0), 1.0), total: 1.0)
            .tint(.white)
            .progressViewStyle(.linear)
    }
    
    var successfulLoading: some View {
        Text("Success")
            .font(.largeTitle)
            .foregroundStyle(.white)
    }
    
    var errorLoading: some View {
        Text("Error")
            .font(.largeTitle)
            .foregroundStyle(.red)
    }
}

#Preview {
    LoginView()
}
