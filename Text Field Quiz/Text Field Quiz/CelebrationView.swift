//
//  CelebrationView.swift
//  Text Field Quiz
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct CelebrationView: View {
    
    @Binding var isCorrect: Bool
    @Binding var answer: String
    
    var body: some View {
        ZStack {
            Text(isCorrect ? "YAY! The answer is \(answer)" : "WHAAT! The answer is not \(answer)!")
                .font(.system(size: 60, weight: .bold))
                .padding()
                .foregroundColor(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image(isCorrect ? "correct" : "wrong").resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped())
    }
}

//struct CelebrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        CelebrationView()
//    }
//}
