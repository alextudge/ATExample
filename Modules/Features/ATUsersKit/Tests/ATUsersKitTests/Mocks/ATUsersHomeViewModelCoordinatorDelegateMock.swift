//
//  ATUsersCoordinatorViewModelCoordinatorDelegateMock.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
@testable import ATUsersKit

class ATUsersCoordinatorViewModelCoordinatorDelegateMock: ATUsersCoordinatorViewModelCoordinatorDelegate {
    
    var didRequestPostsValue: Int?
    var didRequestAlbumsValue: Int?
    
    func didRequestPosts(userId: Int) {
        didRequestPostsValue = userId
    }
    
    func didRequestAlbums(userId: Int) {
        didRequestAlbumsValue = userId
    }
}
