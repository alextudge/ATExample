//
//  ATComment.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public struct ATComment: Decodable, Identifiable, Equatable {
    public let postId: Int
    public let id: Int
    public let name: String
    public let email: String
    public var body: String
}
