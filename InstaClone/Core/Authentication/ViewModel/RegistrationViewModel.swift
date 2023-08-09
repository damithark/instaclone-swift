//
//  RegistrationViewModel.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-07-18.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, userName: userName)
        
        userName = ""
        email = ""
        password = ""
    }
}
