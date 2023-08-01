//
//  ATUserNavigationOptions.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

enum ATUserNavigationOptions: String, CaseIterable {
    case posts, albums, tasks
    
    var icon: String {
        switch self {
        case .posts:
            return "signpost.right"
        case .albums:
            return "photo.on.rectangle"
        case .tasks:
            return "checkmark.circle"
        }
    }
    
    var title: String {
        rawValue.capitalized
    }
}
