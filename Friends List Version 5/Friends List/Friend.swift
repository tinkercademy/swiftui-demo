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
}
