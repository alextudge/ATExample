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
    
    func requestedPosts(userId: Int) {
        requestedPostsValue = userId
    }
    
    func requestedAlbums(userId: Int) {
        requestedAlbumsValue = userId
    }
}
