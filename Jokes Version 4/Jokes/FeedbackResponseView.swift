//
//  FeedbackResponseView.swift
//  Jokes
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct FeedbackResponseView: View {
    
    var isPositive: Bool
    
    var body: some View {
        VStack {
            Image(isPositive ? "happy" : "sad")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(isPositive ? "omg thanks ❤️" : "eh u better not say that later i make the app crash then u no more jokes to make u happy anymore")
                .padding()
        }
        
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(isPositive: true)
    }
}
