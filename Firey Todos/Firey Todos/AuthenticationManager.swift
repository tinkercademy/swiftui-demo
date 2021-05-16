//
//  AuthenticationManager.swift
//  Firey Todos
//
//  Created by JiaChen(: on 15/5/21.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthenticationManager: ObservableObject {
    
    @Published var user: User?
    @Published var error: Error?
    @Published var hasError = false
    
    /// Log user in via Firebase
    /// - Parameters:
    ///   - email: User's email address
    ///   - password: User's password
    func login(_ email: String, withPassword password: String) {
        
        // Call firebase auth to log user in
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let uid = result?.user.uid {
                // Successfully signed in
                
                // Store user's credentials to use when they create new tasks
                //   or perform actions
                self.user = User(email: email.lowercased(), id: uid)
                
                // Don't present alert
                self.hasError = false
                
                // Because of the auth observer in SceneDelegate,
                //   once the user is authenticated, they are
                //   automatially brought to the correct view.
                // Thus, there is no need to handle this case.
            } else if let error = error {
                // Handle errors by returning the error back to user
                self.error = error
                
                // Present alert in Auth Manager
                self.hasError = true
            }
        }
    }
    
    /// Sign up for account via Firebase
    /// - Parameters:
    ///   - email: User's email address
    ///   - password: User's password
    func signup(_ email: String, withPassword password: String) {
        
        // Get Firebase to create a user using the email and password
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            if let uid = result?.user.uid {
                // Handling when a new user is successfully created
                
                // Creating a user object
                self.user = User(email: email.lowercased(), id: uid)
                
                self.hasError = false
            } else if let error = error {
                // Failed to create user, handling error
                
                // Present errors to user because sad.
                self.error = error
                self.hasError = true
            }
        })
    }
}
