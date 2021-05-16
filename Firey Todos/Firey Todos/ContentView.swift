//
//  ContentView.swift
//  Firey Todos
//
//  Created by JiaChen(: on 15/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var username = ""
    @State var password = ""
    
    @ObservedObject var authManager = AuthenticationManager()
    
    var body: some View {
        VStack {
            // Email field
            TextField("Email", text: $username)
                // Email keyboard because user is typing in email address
                .keyboardType(.emailAddress)
                .padding()
            
            // Use secure text field for passwords so
            //   passwords appear as ••••••••
            SecureField("Password", text: $password)
                .padding()
            
            Button("Login") {
                // Call auth manager to login using the provided credentials
                authManager.login(username,
                                  withPassword: password)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding([.leading, .trailing])
            .foregroundColor(.white)
            
            Button("Sign Up") {
                // Call auth manager to sign up for account using the
                //   provided credentials
                authManager.signup(username,
                                   withPassword: password)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding([.leading, .trailing])
            .foregroundColor(.white)
        }
        // Handle if any authentication error occurs
        //   i.e. incorrect password, too short password etc.
        //   let Firebase handle error messages
        .alert(isPresented: $authManager.hasError, content: {
            Alert(title: Text("Authentication Error"),
                  message: Text(authManager.error!.localizedDescription),
                  dismissButton: .default(Text("OK")))

        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
