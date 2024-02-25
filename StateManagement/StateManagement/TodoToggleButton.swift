//
//  TodoToggleButton.swift
//  StateManagement
//
//  Created by Robert Wrzochal on 25/02/2024.
//

import SwiftUI

struct TodoToggleButton: View {
    
    @Binding var state: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                state.toggle()
            }
        }, label: {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(.blue)
                    
                    if state {
                        Circle()
                            .frame(width: proxy.size.width * 0.8)
                            .foregroundColor(.blue)
                    }
                }
                .padding(8)
            }
        })
//        .scaledToFit()
        
        

    }
}

struct TodoToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(false) { state in
            TodoToggleButton(state: state)
                .previewLayout(.fixed(width: 100.0, height: 100.0))
        }
    }
//    TodoToggleButton()
}
