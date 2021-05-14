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
            Text(String(counter))
                
                // Set huge font and make it bold
                .font(.system(size: 40,
                              weight: .bold))
                
                // Set text color to white
                .foregroundColor(.white)
            
            // Creating a click me button
            Button("Click Me!") {
                // On click, increment counter by 1
                counter += 1
            }
            // Add padding for background
            .padding()
            
            // Set background color
            .background(Color.pink)
            
            // Set text color
            .foregroundColor(.white)
        }
        
        // Make full screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // Set background to blue
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
