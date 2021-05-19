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
    @State var friends: [Friend] = []
    
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
        }.onAppear {
            friends = Friend.loadFromFile() ?? Friend.getSampleFriends()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
