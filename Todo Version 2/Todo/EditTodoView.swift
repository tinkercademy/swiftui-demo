//
//  EditTodoView.swift
//  Todo
//
//  Created by JiaChen(: on 18/5/21.
//

import SwiftUI

struct EditTodoView: View {
    
    @Binding var todos: [Todo]
    
    var currentTodo: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            TextField("Name", text: $todos[currentTodo].name)
            
            Toggle(isOn: $todos[currentTodo].done, label: {
                Text("Done")
            })
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Edit Todo")
        .navigationBarItems(trailing: Button("Done") {
            presentationMode.wrappedValue.dismiss()
        }).onDisappear(perform: {
            Todo.saveToFile(todos: todos)
        })
    }
}
