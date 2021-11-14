//
//  FirebaseManager.swift
//  SigninSignup_Exp
//
//  Created by Shak Feizi on 11/13/21.
//

import Foundation
import Firebase


class FirebaseManager {
    // SHAK: Properties
    static let shared: FirebaseManager = FirebaseManager()
    var auth = Auth.auth()
    var possible = false
    
    // SHAK: Functions
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard result != nil, error == nil else { return }
        }
    }
}
