//
//  ContentView.swift
//  Friends List
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI

struct ContentView: View {
    
    // Creating a bunch of friends because i
    //   dont have real ones
    var friends = [
        Friend(name:"YJ",
               school: "Tinkercademy",
               imageName: "checkmark.seal.fill",
               slothImage: "sloth1",
               age: 10,
               website: "https://yjsoon.com"),
        Friend(name:"Jia Chen",
               school: "Tinkercademy",
               imageName: "swift",
               slothImage: "sloth2",
               age: 10,
               website: "https://tk.sg"),
        Friend(name:"Fengrun",
               school: "Tinkercademy",
               imageName: "tornado",
               slothImage: "sloth3",
               age: 10,
               website: "https://tk.sg"),
        Friend(name:"Seabass",
               school: "Ngee Ann Poly",
               imageName: "exclamationmark.triangle.fill",
               slothImage: "sloth1",
               age: 10,
               website: "https://tk.sg"),
        Friend(name:"Rui Yang",
               school: "DHS",
               imageName: "crown.fill",
               slothImage: "sloth2",
               age: 10,
               website: "https://tk.sg")
    ]
    
    var body: some View {
        // Create navigation view
        NavigationView {
            
            // Create a list to iterate through friends
            //   and display friend
            List(friends) { friend in
                // When friends are tapped, show friend content view
                //   As this is in a navigation view, we are able to
                //   use a navigation link to accomplish this
                NavigationLink(
                    destination: FriendContentView(friend: friend),
                    label: {
                        FriendRowView(friend: friend)
                    })
            }
            // Set title
            .navigationTitle("My Friends")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
