//
//  NewFriendView.swift
//  Friends List
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct NewFriendView: View {
    
    // Create an empty friend
    @State var friend = Friend(name: "",
                               school: "",
                               imageName: "",
                               slothImage: "sloth1",
                               age: 0,
                               website: "")
    
    @Binding var friends: [Friend]
    
    @Binding var isDeleted: Bool
    
    var friendIndex: Int?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Personal Info")) {
                    TextField("Name", text: $friend.name)
                    TextField("School", text: $friend.school)
                    TextField("Website", text: $friend.website)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                }
                Section(header: Text("Images")) {
                    HStack {
                        Image(systemName: friend.imageName)
                        TextField("Icon Name", text: $friend.imageName)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    TextField("Sloth Image", text: $friend.slothImage)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                
                Section(header: Text("Age")) {
                    Stepper("\(friend.age)", value: $friend.age)
                }
                
                Section(header: Text("Stats")) {
                    HStack {
                        HStack {
                            Image(systemName: friend.attack < 7.5 ? "bolt" : "bolt.fill")
                            Text("Attack")
                        }
                        .frame(width: 100, alignment: .leading)
                        Slider(value: $friend.attack, in: 0...15)
                    }
                    HStack {
                        HStack {
                            Image(systemName: friend.defence < 7.5 ? "shield" : "lock.shield")
                            Text("Defence")
                        }
                        .frame(width: 100, alignment: .leading)
                        Slider(value: $friend.defence, in: 0...15)
                    }
                }
                
                Section {
                    Button(friendIndex == nil ? "Add Friend" : "Save Changes") {
                        if let friendIndex = friendIndex {
                            friends[friendIndex] = friend
                        } else {
                            friends.append(friend)
                        }
                        
                        Friend.saveToFile(friends: friends)
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button(friendIndex == nil ? "Discard Friend" : "Delete Friend") {
                        isDeleted = true
                        
                        if let friendIndex = friendIndex {
                            friends.remove(at: friendIndex)
                            Friend.saveToFile(friends: friends)
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .onAppear {
                if let friendIndex = friendIndex {
                    friend = friends[friendIndex]
                }
            }
            .navigationTitle(friendIndex == nil ? "New Friend" : "Editing Friend")
        }
    }
}
