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
        // Passing sloths over and presenting sloths
        Image(friend.slothImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            
            // Setting navigation title
            .navigationTitle(friend.name)
    }
}

struct FriendContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendContentView(friend: Friend(name:"YJ", school: "Tinkercademy", imageName: "checkmark.seal.fill", slothImage: "sloth1"))
    }
}
