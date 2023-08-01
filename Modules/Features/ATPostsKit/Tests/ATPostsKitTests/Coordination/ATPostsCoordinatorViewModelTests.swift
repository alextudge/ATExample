//
//  ATUsersCoordinatorViewModelTests.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
@testable import ATPostsKit

final class ATPostsCoordinatorViewModelTests: XCTestCase {
    
    private let userId = 1
    var sut: ATPostsCoordinatorViewModel!
    var networkMock: ATExampleNetworkServiceMock!
    var coordinatorMock: ATPostsCoordinatorViewModelCoordinatorDelegateMock!
    
    override func setUp() {
        super.setUp()
        networkMock = ATExampleNetworkServiceMock()
        coordinatorMock = ATPostsCoordinatorViewModelCoordinatorDelegateMock()
        sut = ATPostsCoordinatorViewModel(networkService: networkMock,
                                          coordinatorDelegate: coordinatorMock,
                                          userId: userId)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        networkMock = nil
    }
}

extension ATPostsCoordinatorViewModelTests {
    func test_didTapClose() {
        // When
        sut.didTapClose()
        
        // Then
        XCTAssertTrue(coordinatorMock.postsFlowDidFinishWasCalled)
    }
}
