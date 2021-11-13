//
//  ContentView.swift
//  SigninSignup_Exp
//
//  Created by Shak Feizi on 11/13/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedin {
                Text("You're signed in!")
            } else {
                SigninView()
            }
        }
        .onAppear {
            viewModel.signedin = viewModel.isSignedin
        }
    }
}


struct SigninView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Image("UserLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            VStack {
                TextField("Enter an email...", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                SecureField("Enter a password...", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                Button {
                    guard !email.isEmpty, !password.isEmpty else { return }
                    viewModel.signin(email: email, password: password)
                } label: {
                    Text("Sign In")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            Spacer()
        }
        .navigationTitle(Text("Sign In"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
