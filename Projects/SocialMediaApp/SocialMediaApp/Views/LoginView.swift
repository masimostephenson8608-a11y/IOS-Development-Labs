//
//  LoginView.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 2/6/26.
//

import SwiftUI

struct LoginView: View {
    @State var homeViewModel = HomeScreenViewModel(apiService: ApiService())
    
    @State var email = "masimo.stephenson8608@stu.mtec.edu"
    @State var password = "gawtij-kifzy2-depcEh"
    @State var failedLogin = false
    @State var loggedInSuccessfully = false
    
    var body: some View {
        GeometryReader { geometry in
            switch loggedInSuccessfully {
            case false:
                NavigationStack {
                    ZStack {
                        BackgroundView().ignoresSafeArea()
                        VStack {
                            Spacer()
                                .frame(height: geometry.size.height / 6)
                            
                            Text("Login")
                                .font(.system(size: geometry.size.height / 15).bold())
                            
                            Spacer().frame(height: geometry.size.height / 6)
                            
                            TextField("Email:", text: $email)
                                .textInputAutocapitalization(.never)
                                .frame(width: geometry.size.width / 1.5)
                                .foregroundStyle(.blue.secondary)
                                .padding(15)
                                .background(Capsule().foregroundStyle(.white.tertiary))
                            
                            Spacer().frame(height: geometry.size.width / 20)
                            
                            SecureField("Password:", text: $password)
                                .textInputAutocapitalization(.never)
                                .frame(width: geometry.size.width / 1.5)
                                .foregroundStyle(.blue.secondary)
                                .padding(15)
                                .background(Capsule().foregroundStyle(.white.tertiary))
                            
                            Spacer().frame(height: geometry.size.width / 20)
                            
                            Button("Login") {
                                if email.isEmpty || password.isEmpty {
                                    return
                                }
                                Task {
                                    if let newUser = try await apiLogin() {
                                        homeViewModel.user = newUser
                                        loggedInSuccessfully = true
                                    }
                                    if homeViewModel.user == nil {
                                        failedLogin = true
                                    }
                                }
                            }
                            
                            if failedLogin == true {
                                tryAgainView
                                    .frame(width: geometry.size.width / 2)
                                    .padding(35)
                            }
                            
                            Spacer()
                        }
                    }
                }
            case true:
                MainTabView().environment(homeViewModel)
            }
        }
    }
    
    var tryAgainView: some View {
        Text("Email or Password was incorrect. Please try again")
            .foregroundStyle(.red)
            .multilineTextAlignment(.center)
    }
    
    func apiLogin() async throws -> SignInResponse? {
        var result: SignInResponse? = nil
        if email.isEmpty || password.isEmpty { return nil }
        
        do {
            result = try await homeViewModel.apiService.login(email, password)
            return result ?? nil
        } catch {
            print(error)
            return nil
        }
    }
}

#Preview {
    LoginView()
}
