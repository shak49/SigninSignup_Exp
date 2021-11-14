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
                VStack {
                    Text("You're signed in!")
                    Button {
                        viewModel.signout()
                    } label: {
                        Text("Sign Out")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
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
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(Color(.secondarySystemBackground))
                SecureField("Enter a password...", text: $password)
                    .padding()
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
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
                HStack {
                    Button {
                        
                    } label: {
                        Image("google")
                            .resizable()
                    }
                    .frame(width: 40, height: 40)
                .padding()
                    Button {
                        
                    } label: {
                        Image("apple")
                            .resizable()
                    }
                    .frame(width: 50, height: 50)
                .padding()
                    Button {
                        
                    } label: {
                        Image("facebook")
                            .resizable()
                    }
                    .frame(width: 42, height: 42)
                .padding()
                }
                NavigationLink("Create Account", destination: SignupView())
                .padding()
            }
            .padding()
            Spacer()
        }
        .navigationTitle(Text("Sign In"))
    }
}

struct SignupView: View {
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
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(Color(.secondarySystemBackground))
                SecureField("Enter a password...", text: $password)
                    .padding()
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(Color(.secondarySystemBackground))
                Button {
                    guard !email.isEmpty, !password.isEmpty else { return }
                    viewModel.signup(email: email, password: password)
                } label: {
                    Text("Create")
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
        .navigationTitle(Text("Sign up"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
