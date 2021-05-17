//
//  ContentView.swift
//  Quiz
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("This is a quiz question")
                .font(.title)
                .padding()
            
            VStack {
                Button("Option 1") {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                Button("Option 2") {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                
                Button("Option 3") {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
