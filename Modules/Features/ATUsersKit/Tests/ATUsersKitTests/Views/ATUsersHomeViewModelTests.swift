//
//  ATUsersHomeViewModelTests.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
@testable import ATDataModel
@testable import ATUsersKit

final class ATUsersHomeViewModelTests: XCTestCase {
    
    private let userId = 1
    var sut: ATUsersHomeViewModel!
    var coordinatorMock: ATUsersHomeViewModelCoordinatorDelegateMock!
    var networkServiceMock: ATExampleNetworkServiceMock!
    
    override func setUp() {
        super.setUp()
        coordinatorMock = ATUsersHomeViewModelCoordinatorDelegateMock()
        networkServiceMock = ATExampleNetworkServiceMock()
        sut = ATUsersHomeViewModel(networkService: networkServiceMock,
                                   coordinatorDelegate: coordinatorMock)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        networkServiceMock = nil
        coordinatorMock = nil
    }
}

// MARK: Networking
extension ATUsersHomeViewModelTests {
    func test_loadData_networkServiceError() async {
        // Given
        networkServiceMock.error = .invalidUrl
        
        // When
        await sut.loadData()
        
        // Then
        XCTAssertEqual(sut.state, .error(message: "Something went wrong!"))
        XCTAssertTrue(sut.users.isEmpty)
    }
    
    func test_loadData_networkServiceSuccess() async {
        // Given
        networkServiceMock.object.append([user(), user()])
        
        // When
        await sut.loadData()
        
        // Then
        XCTAssertEqual(sut.state, .loaded)
        XCTAssertEqual(sut.users.count, 2)
    }
}

// MARK: Business Logic
extension ATUsersHomeViewModelTests {
    func test_state_DefaultValue() {
        XCTAssertEqual(sut.state, .loaded)
    }
    
    func test_view_posts() {
        // When
        sut.view(.posts, userId: userId)
        
        // Then
        XCTAssertEqual(coordinatorMock.requestedPostsValue, userId)
    }
    
    func test_view_albums() {
        // When
        sut.view(.albums, userId: userId)
        
        // Then
        XCTAssertEqual(coordinatorMock.requestedAlbumsValue, userId)
    }
    
    func test_view_tasks() {
        // When
        sut.view(.tasks, userId: userId)
        
        // Then
        XCTAssertEqual(coordinatorMock.requestedTasksValue, userId)
    }
}

private extension ATUsersHomeViewModelTests {
    func user() -> ATUser {
        ATUser(id: 1, name: "name", username: "userName", email: "email", phone: "phone", website: "website", address: ATUser.ATAddreess(street: "street", suite: "suite", city: "city", zipcode: "zipcode", geo: ATUser.ATAddreess.ATCoordinates(lat: "lat", lng: "lng")), company: ATUser.ATCompany(name: "name", catchPhrase: "catchPhrase", bs: "bs"))
    }
}
