//
//  Todo.swift
//  Todo Demo
//
//  Created by YJ Soon on 31/7/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import Foundation
import SwiftUI

class Todo: Identifiable, Equatable, Codable {
    
    var id: String
    var name: String
    var done = false
    
    init(name: String, done: Bool = false) {
        self.name = name
        self.id = UUID().uuidString
        
        self.done = done
    }
    
    init() {
        self.name = ""
        self.id = UUID().uuidString
    }
    
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        rhs.id == lhs.id
    }
    
    static func loadSampleData() -> [Todo] {
        return [
            Todo(name: "Save the cat"),
            Todo(name: "Go see a doctor for deadly scratches")
        ]
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "todos"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print(documentsDirectory.absoluteString)
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }

    static func saveToFile(todos: [Todo]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(todos)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadFromFile() -> [Todo]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedFriendsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedFriends = try? propertyListDecoder.decode(Array<Todo>.self, from: retrievedFriendsData) else { return nil }
        return decodedFriends
    }
}
