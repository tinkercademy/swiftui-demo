//
//  ContentView.swift
//  Instagram
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = ""
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.title)
                .bold()
                .padding()
            Button("Post") {
                text += "gram!"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
