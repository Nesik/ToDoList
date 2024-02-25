//
//  TodoItem.swift
//  StateManagement
//
//  Created by Robert Wrzochal on 09/02/2024.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}


