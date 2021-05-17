//
//  ContentView.swift
//  Todo
//
//  Created by JiaChen(: on 18/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos: [Todo] = []
    
    @State var isNewTodoPresented = false
    @State var isEditTodoPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    NavigationLink(destination: EditTodoView(todos: $todos,
                                                             currentTodo: todos.firstIndex(of: todo)!)) {
                        Text(todo.name)
                            .bold()
                            .padding(8)
                            .background(todo.done ?
                                            Color(red: 238 / 255,
                                                  green: 252 / 255,
                                                  blue: 206 / 255,
                                                  opacity: 1) :
                                            Color(red: 167 / 255,
                                                  green: 198 / 255,
                                                  blue: 218 / 255,
                                                  opacity: 1))
                            .cornerRadius(8)
                    }
                }.onDelete { offsets in
                    todos.remove(atOffsets: offsets)
                    Todo.saveToFile(todos: todos)
                }.onMove { source, destination in
                    todos.move(fromOffsets: source, toOffset: destination)
                    Todo.saveToFile(todos: todos)
                }
                
            }.listStyle(PlainListStyle())
            .navigationBarTitle("Todos", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                    isNewTodoPresented = true
                                }, label: {
                                    Image(systemName: "plus")
                                }))
        }
        .sheet(isPresented: $isNewTodoPresented) {
            NewTodoView(todos: $todos)
        }
        .onAppear {
            todos = Todo.loadFromFile() ?? Todo.loadSampleData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
