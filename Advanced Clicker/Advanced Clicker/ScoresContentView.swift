//
//  ScoresContentView.swift
//  Advanced Clicker
//
//  Created by JiaChen(: on 14/5/21.
//

import SwiftUI

struct ScoresContentView: View {
    
    // When true, it shows clicker
    @State private var isShowingClicker = false
    
    @State var scores: [Double] = []
    
    var body: some View {
        NavigationView {
            // Create a list with the scores
            List(scores, id: \.hashValue) { score in
                Text(String(score))
            }
            
            // Create a navigation bar button called
            //   "Play". This should trigger the clicker
            .navigationBarItems(trailing:
                                    Button("Play") {
                                        isShowingClicker = true
                                    }
            )
            
            // Large navigation bar style with
            //   "Scores" as title
            .navigationTitle("Scores")
            .fullScreenCover(isPresented: $isShowingClicker) {
                ClickerContentView(scores: $scores)
            }
        }
    }
}

struct ScoresContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresContentView()
    }
}
