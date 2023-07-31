//
//  ATAlbum.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public struct ATAlbum: Decodable, Identifiable, Equatable {
    public let userId: Int
    public let id: Int
    public let title: String
}
