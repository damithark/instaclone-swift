//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-07-18.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
