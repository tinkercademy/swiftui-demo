//
//  FriendRowView.swift
//  Friends List
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI

struct FriendRowView: View {
    
    var friend: Friend
    var body: some View {
        // Create Friend Row View with an image, the person's name and school
        HStack {
            Image(systemName: friend.imageName).frame(width: 25)
            
            VStack(alignment: .leading) {
                Text(friend.name)
                Text(friend.school).font(.system(size: 12))
            }
        }
    }
}

struct FriendRowView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRowView(friend: Friend(name:"YJ", school: "Tinkercademy", imageName: "checkmark.seal.fill", slothImage: "sloth1"))
    }
}
