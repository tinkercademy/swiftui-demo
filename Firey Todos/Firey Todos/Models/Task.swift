//
//  Task.swift
//  Firey Todos
//
//  Created by JiaChen(: on 16/5/21.
//

import Foundation
import Firebase

struct Task: Identifiable {
    var id: String {
        reference?.description() ?? name
    }
    
    var name: String
    var completed: Bool
    var addedByUser: String
    var reference: DatabaseReference?
    
    func toDictionary() -> Any {
        return [
            "name": name,
            "completed": completed,
            "addedByUser": addedByUser
        ]
    }
}
