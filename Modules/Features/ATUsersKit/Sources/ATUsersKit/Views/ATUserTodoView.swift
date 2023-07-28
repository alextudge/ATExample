//
//  ATUserTodoView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUIKit

struct ATUserTodoView: View {
    
    @Bindable var viewModel: ATUserTodoViewModel
    
    var body: some View {
        ATLoadableView(state: $viewModel.state) {
            List {
                Label("Tasks", systemImage: "pencil")
                    .font(.headline)
                ForEach(viewModel.todos) { todo in
                    Label(todo.title, systemImage: todo.completed ? "checkmark.circle.fill" : "checkmark.circle")
                        .symbolEffect(.bounce, value: todo)
                        .onTapGesture {
                            viewModel.didTap(todo: todo.id)
                        }
                }
            }.listStyle(.plain)
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}
