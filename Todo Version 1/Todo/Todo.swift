//
//  Todo.swift
//  Todo Demo
//
//  Created by YJ Soon on 31/7/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import Foundation
import SwiftUI

class Todo: Identifiable, Equatable {
    
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
}
