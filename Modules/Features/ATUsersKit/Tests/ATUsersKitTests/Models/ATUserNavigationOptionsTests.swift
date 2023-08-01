//
//  ATUsersCoordinatorViewModelTests.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
@testable import ATUsersKit

final class ATUserNavigationOptionsTests: XCTestCase {
    func test_titles() {
        XCTAssertEqual(ATUserNavigationOptions.albums.title, "Albums")
        XCTAssertEqual(ATUserNavigationOptions.posts.title, "Posts")
        XCTAssertEqual(ATUserNavigationOptions.tasks.title, "Tasks")
    }
    
    func test_systemImages() {
        XCTAssertEqual(ATUserNavigationOptions.albums.icon, "Albums")
        XCTAssertEqual(ATUserNavigationOptions.posts.icon, "Albums")
        XCTAssertEqual(ATUserNavigationOptions.tasks.icon, "Albums")
    }
}
