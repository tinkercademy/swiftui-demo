//
//  ContentView.swift
//  Cat Fact
//
//  Created by JiaChen(: on 14/5/21.
//

import SwiftUI

struct ContentView: View {
    
    // Creating Cat HTTP Manager
    @ObservedObject var manager = CatHTTPManager()
    
    var body: some View {
        VStack {
            // If there are cat facts available, we show cat fact
            if let catFact = manager.catFact {
                
                // Show cat fact in text
                Text(catFact.text)
                    // Center align text
                    .multilineTextAlignment(.center)
                    
                    // ∞ number of lines
                    .lineLimit(nil)
                
                    // Add padding so text looks better
                    .padding()
            }
            
            Button("Gimme cat fact meow") {
                // Send HTTP request using the manager
                manager.getCat()
            }
                // Add padding so background looks good
                .padding()
                
                // Add blue background
                .background(Color.blue)
                
                // Because default text color is blue, we need to
                //   change the text color to white.
                //   Text Color is Foreground Color
                .foregroundColor(.white)
                
                // Add corner radius because... nice.
                .cornerRadius(16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
