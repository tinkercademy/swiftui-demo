//
//  Friend.swift
//  Friends List Version 1
//
//  Created by YJ Soon on 27/6/20.
//  Copyright © 2020 YJ Soon. All rights reserved.
//

import Foundation

struct Friend: Identifiable, Equatable, Codable {
    
    // Just need to create a unique ID
    var id: String {
        name + school + imageName
    }
    
    var name: String
    var school: String
    var imageName: String
    var slothImage: String
    
    var age: Int
    var website: String
    var attack: Double = 10
    var defence: Double = 10
    
    static func getSampleFriends() -> [Friend] {
        // because you can't get real ones
        return [
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
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "friends"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print(documentsDirectory.absoluteString)
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(friends: [Friend]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Friend]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedFriendsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedFriends = try? propertyListDecoder.decode(Array<Friend>.self, from: retrievedFriendsData) else { return nil }
        return decodedFriends
    }
}
