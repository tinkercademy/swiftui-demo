//
//  FriendsManager.swift
//  Friends List
//
//  Created by JiaChen(: on 17/5/21.
//

import Foundation
import SwiftUI

class FriendsManager: ObservableObject {
    @Published var friends: [Friend] = []
    
    let sampleFriends = [Friend(name:"YJ",
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
                                website: "https://tk.sg")]
    
    func saveFriends() {
        let plistEncoder = PropertyListEncoder()
        
        guard let encodedFriends = try? plistEncoder.encode(friends) else { return }
        
        UserDefaults.standard.set(encodedFriends, forKey: "friends")
    }
    
    func loadFriends() {
        let decoder = PropertyListDecoder()
        
        if let encodedFriends = UserDefaults.standard.object(forKey: "friends") as? Data,
           let decodedFriends = try? decoder.decode([Friend].self, from: encodedFriends) {
            friends = decodedFriends
        } else {
            friends = sampleFriends
        }
    }
    
    init() {
        loadFriends()
        
        NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification,
                                               object: nil,
                                               queue: .main) { _ in
            self.loadFriends()
        }
    }
}
