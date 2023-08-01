//
//  ATUserTodoView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUIKit

struct ATUserTodoView: View {
    
    @State var viewModel: ATUserTodoViewModel
    
    var body: some View {
        ATLoadableView(state: $viewModel.state) {
            List {
                ForEach(viewModel.uncompletedTodos) { todo in
                    Label(todo.title, systemImage: todo.completed ? "checkmark.circle.fill" : "checkmark.circle")
                        .symbolEffect(.bounce, value: todo)
                        .onTapGesture {
                            viewModel.didTap(todo: todo.id)
                        }
                }
            }
            .animation(.default, value: viewModel.todos)
        }
        .navigationTitle("\(viewModel.userName ?? "Contact")'s Tasks")
        .task {
            await viewModel.loadData()
        }
    }
}
