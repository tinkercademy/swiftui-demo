//
//  TaskListRow.swift
//  Firey Todos
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI

struct TaskListRow: View {
    
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
            
            VStack(alignment: .leading) {
                Text(task.name)
                    .bold()
                Text("Added by " + task.addedByUser)
                    .font(.system(size: 12))
            }
        }
    }
}

struct TaskListRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskListRow(task: Task(name: "Heightened Alertness",
                               completed: false,
                               addedByUser: "gov.sg"))
    }
}
