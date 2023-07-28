//
//  ATUserTodoViewModelTests.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
@testable import ATDataModel
@testable import ATUsersKit

final class ATUserTodoViewModelTests: XCTestCase {
    
    var sut: ATUserTodoViewModel!
    var networkServiceMock: ATExampleNetworkServiceMock!
    
    override func setUp() {
        super.setUp()
        networkServiceMock = ATExampleNetworkServiceMock()
        sut = ATUserTodoViewModel(userId: 1, networkService: networkServiceMock)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        networkServiceMock = nil
    }
}
