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
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "triangle.fill")
                        Text("Option 1")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "diamond.fill")
                        Text("Option 2")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                }
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "circle.fill")
                        Text("Option 3")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "square.fill")
                        Text("Option 4")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                }
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
