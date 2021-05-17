//
//  FeedbackResponseView.swift
//  Jokes
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct FeedbackResponseView: View {
    
    var isPositive: Bool
    
    @State var scale: CGFloat = 1
    @State var rotation: Double = -5
    
    var body: some View {
        VStack {
            Image(isPositive ? "happy" : "sad")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 0.15)
                            .repeatForever())
            Text(isPositive ? "omg thanks ❤️" : "eh u better not say that later i make the app crash then u no more jokes to make u happy anymore")
                .padding()
        }.onAppear {
            scale = 0.8
            rotation = 5
        }
        
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(isPositive: true)
    }
}
