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
    @State var friends: [Friend] = [Friend(name:"YJ",
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
    
    @State var isPresentingNewFriend = false
    
    @State var newFriendIsDeleted = false
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        // Create navigation view
        NavigationView {
            
            // Create a list to iterate through friends
            //   and display friend
            List {
                ForEach(friends) { friend in
                    // When friends are tapped, show friend content view
                    //   As this is in a navigation view, we are able to
                    //   use a navigation link to accomplish this
                    NavigationLink(
                        destination: FriendContentView(friends: $friends,
                                                       index: friends.firstIndex(of: friend)!),
                        label: {
                            FriendRowView(friend: friend)
                        })
                }
                .onDelete { offsets in
                    friends.remove(atOffsets: offsets)
                }
                .onMove { source, destination in
                    friends.move(fromOffsets: source, toOffset: destination)
                }
            }
            // Add edit button
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                isPresentingNewFriend = true
            }, label: {
                Image(systemName: "plus")
            }))
            // Set title
            .navigationTitle("My Friends")
            .environment(\.editMode, $editMode)
        }.sheet(isPresented: $isPresentingNewFriend) {
            NewFriendView(friends: $friends, isDeleted: $newFriendIsDeleted)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
