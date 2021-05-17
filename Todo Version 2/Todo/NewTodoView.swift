//
//  NewTodoView.swift
//  Todo
//
//  Created by JiaChen(: on 18/5/21.
//

import SwiftUI

struct NewTodoView: View {
    
    @Binding var todos: [Todo]
    
    @State var todo = Todo()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                TextField("Name", text: $todo.name)
                
                Toggle(isOn: $todo.done, label: {
                    Text("Done")
                })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("New Todo")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            },
            trailing: Button("Save") {
                todos.append(todo)
                Todo.saveToFile(todos: todos)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
