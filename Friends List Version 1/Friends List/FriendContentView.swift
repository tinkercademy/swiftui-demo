//
//  FriendContentView.swift
//  Friends List
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI

struct FriendContentView: View {
    
    // Pass the friend object through
    var friend: Friend
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle(friend.name)
    }
}

struct FriendContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendContentView(friend: Friend(name:"YJ", school: "Tinkercademy", imageName: "checkmark.seal.fill"))
    }
}
