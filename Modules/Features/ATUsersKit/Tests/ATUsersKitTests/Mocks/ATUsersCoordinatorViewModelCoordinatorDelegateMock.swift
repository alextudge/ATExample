//
//  ATUsersCoordinatorViewModelCoordinatorDelegateMock.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
@testable import ATUsersKit

class ATUsersHomeViewModelCoordinatorDelegateMock: ATUsersHomeViewModelCoordinatorDelegate {
    
    var requestedPostsValue: Int?
    var requestedAlbumsValue: Int?
    var requestedTasksValue: Int?
    
    func requested(view type: ATUsersKit.ATUserNavigationOptions, userId: Int) {
        switch type {
        case .albums:
            requestedAlbumsValue = userId
        case .posts:
            requestedPostsValue = userId
        case .tasks:
            requestedTasksValue = userId
        }
    }
}
