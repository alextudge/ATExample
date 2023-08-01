//
//  ATUsersCoordinatorViewModelTests.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
import SwiftUI
@testable import ATUsersKit

final class ATUsersCoordinatorViewModelTests: XCTestCase {
    
    var sut: ATUsersCoordinatorViewModel!
    var coordinatorDelegateMock: ATUsersCoordinatorViewModelCoordinatorDelegateMock!
    var networkMock: ATExampleNetworkServiceMock!
    var navigationPath: NavigationPath!
    
    override func setUp() {
        super.setUp()
        navigationPath = NavigationPath()
        coordinatorDelegateMock = ATUsersCoordinatorViewModelCoordinatorDelegateMock()
        networkMock = ATExampleNetworkServiceMock()
        sut = ATUsersCoordinatorViewModel(networkService: networkMock,
                                          coordinatorDelegate: coordinatorDelegateMock,
                                          navigationPath: Binding(get: {
            self.navigationPath
        }, set: { value in
            self.navigationPath = value
        }))
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        networkMock = nil
        coordinatorDelegateMock = nil
    }
}

// MARK: ATUsersHomeViewModelCoordinatorDelegate
extension ATUsersCoordinatorViewModelTests {
    func test_requestedPosts_notifiesCoordinatorDelegate() {
        // When
        sut.requested(view: .posts, userId: 7)
        
        // Then
        XCTAssertEqual(coordinatorDelegateMock.didRequestPostsValue, 7)
    }
    
    func test_requestedAlbums_notifiesCoordinatorDelegate() {
        // When
        sut.requested(view: .albums, userId: 7)
        
        // Then
        XCTAssertEqual(coordinatorDelegateMock.didRequestAlbumsValue, 7)
    }
    
    func testRequestedTasks_addsToNavigationPath() {
        // When
        sut.requested(view: .tasks, userId: 7)
        
        // Then
        XCTAssertEqual(sut.navigationPath.wrappedValue.count, 1)
    }
}
