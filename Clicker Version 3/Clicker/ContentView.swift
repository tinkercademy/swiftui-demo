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
    
    @State var clickButtonEnabled = true
    
    @State var congratsText = "Congrats! You're a mini slacker"
    
    @State var time = 0.0
    
    // Creating a timer instance
    //   This timer will fire every 0.1 seconds. There is
    //   a snippet at the bottom where it handles what
    //   happens when the timer is fired.
    var timer = Timer.publish(every: 0.1,
                              on: .main,
                              in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Days not spent doing work\n\(counter)")
                
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
            Button(clickButtonEnabled ? "Another Day 😎" : "Finished") {
                
                // If the click button is enabled, increment
                if clickButtonEnabled {
                    counter += 1
                    
                    if counter == 30 {
                        clickButtonEnabled = false
                        congratsText = "You're done in \(time) seconds! No more holidays!"
                    }
                }
            }
            // Add padding for background
            .padding()
            
            // Set background color
            .background(Color.red)
            
            // Set text color
            .foregroundColor(.white)
            
            // If counter is more than 10, show congrats text
            if counter >= 10 {
                Text(congratsText)
            }
            
            if counter == 30 {
                Button("Reset") {
                    
                    // Reset counter
                    counter = 0
                    
                    // Reset time
                    time = 0
                    
                    // Reenable click button
                    clickButtonEnabled = true
                    
                    // Reset congrats text
                    congratsText = "Congrats! You're a mini slacker"
                }
                .padding()
            }
        }
        
        // Make full screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // Set background to blue
        .background(Color.yellow)
        
        
        // Observe the timer, ever 0.1 seconds this gets fired and it
        //   adds 0.1 to the time variable
        .onReceive(timer) { _ in
            time += 0.1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
