//
//  ATUsersCoordinatorViewModelTests.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
@testable import ATUsersKit

final class ATUsersCoordinatorViewModelTests: XCTestCase {
    
    var sut: ATUsersCoordinatorViewModel!
    var coordinatorDelegateMock: ATUsersCoordinatorViewModelCoordinatorDelegateMock!
    var networkMock: ATExampleNetworkServiceMock!
    
    override func setUp() {
        super.setUp()
        coordinatorDelegateMock = ATUsersCoordinatorViewModelCoordinatorDelegateMock()
        networkMock = ATExampleNetworkServiceMock()
        sut = ATUsersCoordinatorViewModel(networkService: networkMock, coordinatorDelegate: coordinatorDelegateMock)
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
        sut.requestedPosts(userId: 7)
        
        // Then
        XCTAssertEqual(coordinatorDelegateMock.didRequestPostsValue, 7)
    }
    
    func test_requestedAlbums_notifiesCoordinatorDelegate() {
        // When
        sut.requestedAlbums(userId: 7)
        
        // Then
        XCTAssertEqual(coordinatorDelegateMock.didRequestAlbumsValue, 7)
    }
}
