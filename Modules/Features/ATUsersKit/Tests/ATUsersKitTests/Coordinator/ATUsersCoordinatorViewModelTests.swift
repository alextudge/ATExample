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
    var networkMock: ATExampleNetworkServiceMock!
    
    override func setUp() {
        super.setUp()
        networkMock = ATExampleNetworkServiceMock()
        sut = ATUsersCoordinatorViewModel(networkService: networkMock)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        networkMock = nil
    }
}

// MARK: ATUsersHomeViewModelCoordinatorDelegate
extension ATUsersCoordinatorViewModelTests {
    func test_requestedPosts_appendsNewViewType() {
        XCTAssertTrue(sut.navigationPath.isEmpty)
        sut.requestedPosts(userId: 1)
        XCTAssertFalse(sut.navigationPath.isEmpty)
    }
}
