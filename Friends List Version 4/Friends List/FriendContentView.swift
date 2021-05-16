//
//  FriendContentView.swift
//  Friends List
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI
import SafariServices

struct FriendContentView: View {
    
    // Pass the friend object through
    @State var friend: Friend
    
    @State var isWebsitePresented = false
    
    var body: some View {
        // Passing sloths over and presenting sloths
        VStack {
            Image(friend.slothImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                Text("\(friend.school), age \(friend.age)")
                
                Divider()
                
                HStack(spacing: 8) {
                    Text("Attack")
                    Slider(value: $friend.attack, in: 0...15) {
                        
                    }
                }
                
                HStack(spacing: 8) {
                    Text("Defence")
                    Slider(value: $friend.defence, in: 0...15) {
                        
                    }
                }
                
                Divider()
                
                Button("Visit Website") {
                    isWebsitePresented = true
                }
            }.padding()
        }
        .sheet(isPresented: $isWebsitePresented, content: {
            if let url = URL(string: friend.website) {
                SafariView(url: url)
            }
        })
            // Setting navigation title
            .navigationTitle(friend.name)
    }
}

struct FriendContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendContentView(friend: Friend(name:"YJ", school: "Tinkercademy", imageName: "checkmark.seal.fill", slothImage: "sloth1", age: 10, website: "https://yjsoon.com"))
    }
}
