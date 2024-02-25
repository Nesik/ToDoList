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
            Button("button", action: {
                item.isDone.toggle()
            })
            
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
            .padding(.leading)
            
            Spacer()
        }
        .padding()
        .frame(height: 70)
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
