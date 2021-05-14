//
//  ContentView.swift
//  Advanced Clicker
//
//  Created by JiaChen(: on 14/5/21.
//

import SwiftUI

struct ClickerContentView: View {
    
    @State var counter = 0
    @State var time = 0.0
    
    // Scores value passed from ScoresContentView
    //   Once we are done, we can append the time to
    //   the scores array and update ScoresContentView
    @Binding var scores: [Double]
    
    // Get the presentation mode
    //   This is mainly used to dismiss the View after
    //   we are done with it.
    @Environment(\.presentationMode) var presentationMode
    
    // Creating a timer instance
    //   This timer will fire every 0.1 seconds. There is
    //   a snippet at the bottom where it handles what
    //   happens when the timer is fired.
    var timer = Timer.publish(every: 0.1,
                              on: .main,
                              in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            Text("\(counter)")
        }
        // Max width and height so it takes up full screen
        //   Mainly for the tap gesture to work full screen
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        
        // Change background color!
        .background(Color.green)
        
        // Handling when the user taps the view
        .onTapGesture {
            // Increment counter every tap
            counter += 1
            
            // User has hit 30 clicks!
            if counter == 30 {
                
                // Output results onto console
                print("You done")
                print("You took \(time) seconds")
                
                // Rounding off to 1 d.p.
                time = round(time * 10) / 10
                
                // Add time to scores array
                //   Scores array automatically updates the ScoresContentView because it is a Binding variable
                scores.append(time)
                
                // Dismiss and go home
                presentationMode.wrappedValue.dismiss()
            }
        }
        
        // Observe the timer, ever 0.1 seconds this gets fired and it
        //   adds 0.1 to the time variable
        .onReceive(timer) { _ in
            time += 0.1
        }
    }
}
