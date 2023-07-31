//
//  ATUserTodoViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
import ATInterfacesKit
import ATDataModel
import ATNetworkingKit
import Observation

@Observable
class ATUserTodoViewModel {
    
    var state = ATViewState.loaded
    var todos = [ATTodo]()
    var userName: String?
    private let userId: Int
    private let networkService: ATExampleNetworkServiceProtocol
    var uncompletedTodos: [ATTodo] {
        todos.filter { !$0.completed }
    }
    
    init(userId: Int,
         networkService: ATExampleNetworkServiceProtocol) {
        self.userId = userId
        self.networkService = networkService
    }
    
    func loadData() {
        state = .loading
        Task {
            do {
                userName = try await networkService.request(endpoint: ATUsersEndpoint.user(id: userId), type: ATUser.self).name
                todos = try await networkService.request(endpoint: ATUsersEndpoint.todos(userId: userId), type: [ATTodo].self)
                    .sorted(by: { $1.completed != $0.completed })
                state = .loaded
            } catch {
                state = .error(message: "Something went wrong!")
            }
        }
    }
    
    func didTap(todo id: Int) {
        if let index = todos.firstIndex(where: { $0.id == id }) {
            todos[index].toggleCompleted()
        }
    }
}

extension ATUserTodoViewModel: Equatable, Hashable {
    public static func == (lhs: ATUserTodoViewModel, rhs: ATUserTodoViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
