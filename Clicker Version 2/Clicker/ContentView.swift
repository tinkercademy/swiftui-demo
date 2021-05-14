//
//  ContentView.swift
//  Clicker
//
//  Created by JiaChen(: on 14/5/21.
//

import SwiftUI

struct ContentView: View {
    
    // Keep track of count
    @State var counter = 0
    
    var body: some View {
        VStack {
            Text("Packets of Milo drunk during Circuit Breaker 2\n\(counter)")
                
                // Set huge font
                .font(.system(size: 25))
                
                // Set text color to white
                .foregroundColor(.black)
                
                // Center align text
                .multilineTextAlignment(.center)
            
                // Some padding so the text isn't
                //   right up against the side of the screen
                .padding()
            
            // Creating a click me button
            Button("Just finished another") {
                // On click, increment counter by 1
                counter += 1
            }
            // Add padding for background
            .padding()
            
            // Set background color
            .background(Color.blue)
            
            // Set text color
            .foregroundColor(.white)
            
            // If counter is more than 10, show congrats text
            if counter >= 10 {
                Text("hey diabetes is a thing you know ☠️")
            }
        }
        
        // Make full screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // Set background to blue
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
