//
//  FriendContentView.swift
//  Friends List
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI
import SafariServices

struct FriendContentView: View {
    
    // Ensure friends is binding so when we update the value
    //   here, it gets updated on the home screen.
    
    // Pass the index of the friend object through
    @State var index: Int
    
    @State var isWebsitePresented = false
    
    @State var isPresentingEditView = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var manager = FriendsManager()
    
    @State var isDeleted = false {
        didSet {
            if isDeleted {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    var body: some View {
        // Passing sloths over and presenting sloths
        VStack {
            Image(manager.friends[index].slothImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                Text("\(manager.friends[index].school), age \(manager.friends[index].age)")
                
                Divider()
                
                HStack(spacing: 8) {
                    Text("Attack")
                    Slider(value: $manager.friends[index].attack, in: 0...15)
                }
                
                HStack(spacing: 8) {
                    Text("Defence")
                    Slider(value: $manager.friends[index].defence, in: 0...15)
                }
                
                Divider()
                
                Button("Visit Website") {
                    isWebsitePresented = true
                }
            }.padding()
        }
        .sheet(isPresented: $isWebsitePresented, content: {
            if let url = URL(string: manager.friends[index].website) {
                SafariView(url: url)
            }
        })
        .sheet(isPresented: $isPresentingEditView) {
            NewFriendView(isDeleted: $isDeleted, friendIndex: index)
        }
        // Setting navigation title
        .navigationTitle(manager.friends[index].name)
        .navigationBarItems(trailing: Button("Edit") {
            isPresentingEditView = true
        })
    }
}
