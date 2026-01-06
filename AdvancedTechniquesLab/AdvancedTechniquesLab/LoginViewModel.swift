//
//  LoginViewModel.swift
//  AdvancedTechniquesLab
//
//  Created by Masimo Stephenson on 1/5/26.
//

import Foundation
import Observation

@Observable
class LoginViewModel {
    var username = ""
    var password = ""
    var loadingState: LoadingState = .none
    var loadingProgress = 0.1
    
    
    enum LoadingState {
        case none, loading, error, success
    }
    
    func loading() async {
        let randomNumber = Int.random(in: 0...50)
        Task {
        await increment()
        }
            try? await Task.sleep(for: .seconds(1))
            
            if randomNumber < 25 {
                loadingState = .error
            } else if randomNumber > 25 {
                loadingState = .success
            }
    }
    
    func increment() async {
        while loadingProgress < 1.0 {
            loadingProgress += 0.2
            try? await Task.sleep(for: .milliseconds(200))
        }
    }

}
