//
//  TasksManager.swift
//  Firey Todos
//
//  Created by JiaChen(: on 16/5/21.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import SwiftUI

// Firebase Realtime Database Rules
//
// {
//   "rules": {
//     ".read": "auth.uid != null",
//     ".write": "auth.uid != null"
//   }
// }

class TasksManager: ObservableObject {
    let db = Database.database(url: "https://firey-tasks-default-rtdb.asia-southeast1.firebasedatabase.app").reference(withPath: "tasks")
    
    @Published var tasks: [Task] = []
    
    init() {
        db.queryOrdered(byChild: "completed").observe(.value) { (snapshot) in
            
            // create temporary tasks array. We're going to repalace them all
            var tempTasks: [Task] = []
            
            // Each child is a key:value pair. We ignore the key, but we want the value
            for childSnapshot in snapshot.children {
                // Lots of casting here. Yer a wizard, Harry!
                if let childSnapshot = childSnapshot as? DataSnapshot,
                    let taskDictionary = childSnapshot.value as? [String:AnyObject],
                    let name = taskDictionary["name"] as? String,
                    let completed = taskDictionary["completed"] as? Bool,
                    let addedByUser = taskDictionary["addedByUser"] as? String {
                    
                    let task = Task(name: name,
                                    completed: completed,
                                    addedByUser: addedByUser,
                                    reference: childSnapshot.ref)
                    tempTasks.append(task)
                }
            }
            
            self.tasks = tempTasks
        }
    }
    
    func add(_ task: Task) {
        
        tasks.append(task)
        
        let taskRef = db.child(task.name)
        taskRef.setValue(task.toDictionary())
    }
    
    func toggleComplete(_ task: Task) {
        task.reference?.updateChildValues(["completed": !task.completed])
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
