//
//  TodoItemRow.swift
//  StateManagement
//
//  Created by Robert Wrzochal on 09/02/2024.
//

import SwiftUI

struct TodoItemRow: View {
    
    @Binding var item: TodoItem
    
    
    var body: some View {
        HStack {
            TodoToggleButton(state: $item.isDone)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                
                if let description = item.description {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(item.isDone)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}


struct TodoItemRow_Previews: PreviewProvider {
    static let todoItemWithoutDescription = TodoItem(id: UUID(), title: "Buy some bread 🥖", isDone: true)
    
    static let todoItemWithDescription = TodoItem(id: UUID(), title: "Buy some milk 🥛", description: "Get a lactose free one")
    
    static var previews: some View {
        Group{
            TodoItemRow(item: 
                .constant(todoItemWithoutDescription))
                .previewDisplayName("Without Description")
            
            StatefulPreviewWrapper(todoItemWithDescription, content: { todoItem in
                TodoItemRow(item: todoItem)
            })
            
//            TodoItemRow(item:
//                .constant(todoItemWithDescription))
//                .previewDisplayName("With Description")
        }
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
