//
//  ContentView.swift
//  Text Field Quiz
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var answer = ""
    
    @State var isCongratsScreenPresented = false
    @State var isCorrect = false
    
    var body: some View {
        VStack {
            Text("What UI framework are you using?")
                .padding()
                .font(.system(size: 30, weight: .bold))
            
            TextField("Answer", text: $answer) { _ in
                
            } onCommit: {
                isCorrect = answer.lowercased() == "swiftui"
                
                isCongratsScreenPresented = true
            }

        }.sheet(isPresented: $isCongratsScreenPresented) {
            CelebrationView(isCorrect: $isCorrect, answer: $answer)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
