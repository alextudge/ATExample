//
//  ATAppNavigationCoordinatorViewModelTests.swift
//  ATExampleTests
//
//  Created by Alex Tudge on 28/07/2023.
//

import XCTest
@testable import ATAppNavigation

final class ATAppNavigationCoordinatorViewModelTests: XCTestCase {
    
    var networkServiceMock: ATExampleNetworkServiceMock!
    var sut: ATAppNavigationCoordinatorViewModel!
    
    override func setUp() {
        super.setUp()
        networkServiceMock = ATExampleNetworkServiceMock()
        sut = ATAppNavigationCoordinatorViewModel(networkService: networkServiceMock)
    }
    
    override func tearDown() {
        super.tearDown()
        networkServiceMock = nil
        sut = nil
    }
}

// MARK: ATUsersCoordinatorViewModelCoordinatorDelegate
extension ATAppNavigationCoordinatorViewModelTests {
    func test_didRequestPosts_addsToNavigationStack()  {
        XCTAssertEqual(sut.navigationPath.count, 0)
        
        // When
        sut.didRequestPosts(userId: 7)
        
        // Then
        XCTAssertEqual(sut.navigationPath.count, 1)
    }
}

// MARK: ATPostsCoordinatorViewModelCoordinatorDelegate
extension ATAppNavigationCoordinatorViewModelTests {
    func test_postsFlowDidFinish()  {
        XCTAssertEqual(sut.navigationPath.count, 0)
        
        // Given: Posts flow started
        sut.didRequestPosts(userId: 7)
        XCTAssertEqual(sut.navigationPath.count, 1)
        
        // When
        sut.postsFlowDidFinish()
        
        // Then
        XCTAssertEqual(sut.navigationPath.count, 0)
    }
}
