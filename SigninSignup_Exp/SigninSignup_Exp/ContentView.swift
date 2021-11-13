//
//  ContentView.swift
//  SigninSignup_Exp
//
//  Created by Shak Feizi on 11/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
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
                        
                    } label: {
                        Text("Sign In")
                    }

                }
                .padding()
                Spacer()
            }
            .navigationTitle(Text("Sign In"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
