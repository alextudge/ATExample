//
//  ATPostsCoordinatorViewModelCoordinatorDelegateMock.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
@testable import ATPostsKit

class ATPostsCoordinatorViewModelCoordinatorDelegateMock: ATPostsCoordinatorViewModelCoordinatorDelegate {
    
    var postsFlowDidFinishWasCalled = false
    
    func postsFlowDidFinish() {
        postsFlowDidFinishWasCalled = true
    }
}

