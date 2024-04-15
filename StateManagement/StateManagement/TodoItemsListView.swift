//
//  ContentView.swift
//  StateManagement
//
//  Created by Robert Wrzochal on 09/02/2024.
//

import SwiftUI

struct TodoItemsListView: View {
    
    @StateObject var viewModel = TodoItemsListViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach($viewModel.todoItems) { $todoItem in
                    TodoItemRow(item: $todoItem.onNewValue {
                        viewModel.reorder()
                    })
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's tasks")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    EditButton()
                })
     
            })
            .onAppear {
                viewModel.loadItems()
            }
        }
        
    }
}

#Preview {
    TodoItemsListView()
}
