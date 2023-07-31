//
//  ATPost.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public struct ATPost: Decodable, Identifiable, Equatable {
    public let userId: Int
    public let id: Int
    public let title: String
    public var body: String
}
