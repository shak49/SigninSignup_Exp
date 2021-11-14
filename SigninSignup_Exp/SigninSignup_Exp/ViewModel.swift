//
//  SigninViewModel.swift
//  SigninSignup_Exp
//
//  Created by Shak Feizi on 11/13/21.
//

import Foundation
import FirebaseAuth


class ViewModel: ObservableObject {
    // SHAK: Properties
    var auth = Auth.auth()
    @Published var signedin = false
    var isSignedin: Bool {
        return auth.currentUser != nil
    }
    
    // SHAK: Functions
    func signin(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.signedin = true
            }
        }
    }
    
    func signup(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.signedin = true
            }
        }
    }
    
    func signout() {
        try? auth.signOut()
        self.signedin = false
    }
}
