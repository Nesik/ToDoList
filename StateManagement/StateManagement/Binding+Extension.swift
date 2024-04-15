//
//  Binding+Extension.swift
//  StateManagement
//
//  Created by Robert Wrzochal on 15/04/2024.
//

import SwiftUI

extension Binding {
    
    func onNewValue(_ sideEffect: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {
                wrappedValue
            },
            set: {
                wrappedValue = $0
                sideEffect()
            }
        )
    }
    
}
