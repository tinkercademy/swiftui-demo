//
//  TaskContentView.swift
//  Firey Todos
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI

struct TaskContentView: View {
    
    var user: User
    
    // Create a task manager object to- uh- manage tasks
    @ObservedObject var manager = TasksManager()
    
    var body: some View {
        // Nest the view in a navigation view
        NavigationView {
            
            // Create a list to show tasks
            //   As this list gets its data from the manager, the list dynamically updates
            List(manager.tasks) { task in
                // Create list rows
                TaskListRow(task: task)
                    // Handling when the row is tapped
                    .onTapGesture {
                        manager.toggleComplete(task)
                    }
            }
            .navigationBarTitle("Tasks",
                                displayMode: .inline)
            
            .navigationBarItems(leading:
                                    // Create log out button
                                    Button(action: {
                                        // Ask the manager to log out
                                        //   Sending the user back to the home
                                        //   screen will be automatically handled
                                        //   by the authentication state listener in
                                        //   SceneDelegate
                                        manager.logout()
                                    }, label: {
                                        Image(systemName: "person.fill.xmark")
                                    }),
                                trailing:
                                    // Create a new task button
                                    NavigationLink(
                                        destination: CreateTaskContentView(user: user),
                                        label: {
                                            Image(systemName: "plus")
                                        }
                                    )
            )
        }
    }
}

struct TaskContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskContentView(user: User(email: "test@test.com", id: "abc123"))
    }
}
