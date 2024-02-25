//
//  ContentView.swift
//  StateManagement
//
//  Created by Robert Wrzochal on 09/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoItems: [TodoItem] = (try? .fromJSON(named: "TodoItems")) ?? []
    
    var body: some View {
        
        List($todoItems) { $todoItem in
                TodoItemRow(item: $todoItem)
        }
        
    }
}

#Preview {
    ContentView()
}
