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
    // This timer is not fired yet
    var timer = Timer.publish(every: 0.1,
                              on: .main,
                              in: .common).autoconnect()
    
    @State private var scale: CGFloat = 0
    
    @State private var countdown: Int = 3
    
    
    var colors: [Color] = [.yellow, .orange, .red, .pink]
    var body: some View {
        
        ZStack {
            Text("3")
                .bold()
                .font(.system(size: 100, weight: .bold, design: .default))
                .scaleEffect(countdown == 3 ? scale : 0)
                .opacity(countdown == 3 ? Double(scale) : 1)
                .animation(.easeInOut)
                
            Text("2")
                .bold()
                .font(.system(size: 100, weight: .bold, design: .default))
                .scaleEffect(countdown == 2 ? scale : 0)
                .opacity(countdown == 2 ? Double(scale) : 1)
                .animation(.easeInOut)
                
            Text("1")
                .bold()
                .font(.system(size: 100, weight: .bold, design: .default))
                .scaleEffect(countdown == 1 ? scale : 0)
                .opacity(countdown == 1 ? Double(scale) : 1)
                .animation(.easeInOut)
            
            Text("\(counter)")
                .opacity(countdown == 0 ? 1 : 0)
                .animation(.easeIn)
        }
        // Max width and height so it takes up full screen
        //   Mainly for the tap gesture to work full screen
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        
        // Change background color!
        .background(colors[countdown])
        
        // Enable animations between the background colors
        .animation(.easeInOut)
        
        // Handling when the user taps the view
        .onTapGesture {
            // Make sure countdown == 0 before we proceed
            guard countdown == 0 else { return }
            
            // Increment counter every tap
            counter += 1
            
            // User has hit 30 clicks!
            if counter == 30 {
                
                // Remove the first 3 seconds which was used for countdown
                time -= 3
                
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
            
            if countdown > 0 {
                scale += 0.1
                
                if scale > 1 {
                    countdown -= 1
                    scale = 0
                }
            }
        }
    }
}
