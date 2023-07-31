//
//  ATTodo.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public struct ATTodo: Decodable, Identifiable, Equatable {
    public let userId: Int
    public let id: Int
    public let title: String
    public var completed: Bool
    
    public mutating func toggleCompleted() {
        completed.toggle()
    }
}
