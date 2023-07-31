//
//  ATPhoto.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public struct ATPhoto: Decodable, Identifiable, Equatable {
    public let albumId: Int
    public let id: Int
    public let title: String
    public let url: String
    public let thumbnailUrl: String
}
