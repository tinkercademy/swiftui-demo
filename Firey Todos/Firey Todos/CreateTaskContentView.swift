//
//  CreateTaskContentView.swift
//  Firey Todos
//
//  Created by JiaChen(: on 16/5/21.
//

import FirebaseDatabase
import SwiftUI

struct CreateTaskContentView: View {
    
    @State var taskName = ""
    @ObservedObject var manager = TasksManager()
    @Environment(\.presentationMode) var presentationMode
    
    var user: User
    
    var body: some View {
        // Align leading to have left aligned text
        VStack(alignment: .leading) {
            // Field to type in task name
            
            // The taskName variable gets automatically
            //   updated as the user types
            TextField("Task Name", text: $taskName)
            
            // Create a text to show who added it
            Text("Added by " + user.email)
                .italic()
            
            // Create a fancy ---------- line to separate content
            //   Mainly because it looks nice
            Divider()
                .padding([.top, .bottom])
            
            // Add an add task button
            Button("Add Task") {
                // Tell the manager to add a task with said name and
                //   added by the current user
                manager.add(Task(name: taskName,
                                 completed: false,
                                 addedByUser: user.email))
                
                // Dismiss view when done to return to Tasks
                //   screen.
                presentationMode.wrappedValue.dismiss()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("New Task")
        
    }
}
