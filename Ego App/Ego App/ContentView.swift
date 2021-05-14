//
//  ContentView.swift
//  Ego App
//
//  Created by JiaChen(: on 15/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAnimating = false
    
    var body: some View {
        VStack {
            Text("POMMYCAT")
                .font(.custom("MarkerFelt-Wide", size: 50))
                .scaleEffect(isAnimating ? 0.3: 1)
                .foregroundColor(.green)
                .animation(.easeInOut(duration: 0.2).repeatForever())
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(.easeInOut(duration: 0.2).repeatForever())
                .onTapGesture {
                    isAnimating = true
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isAnimating ? Color.red : Color.blue)
        .animation(.easeInOut(duration: 0.2).repeatForever())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
