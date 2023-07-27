//
//  ATUsersEndpointTests.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
@testable import ATNetworkingKit

final class ATUsersEndpointTests: XCTestCase {
    func testEndpoint_users() {
        XCTAssertEqual(ATUsersEndpoint.users.method, .get)
        XCTAssertEqual(ATUsersEndpoint.users.path, "/users")
    }
    
    func testEndpoint_todos() {
        XCTAssertEqual(ATUsersEndpoint.todos(userId: 1).method, .get)
        XCTAssertEqual(ATUsersEndpoint.todos(userId: 1).path, "/users/1/todos")
    }
}
