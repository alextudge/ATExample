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

// MARK: Networking
extension ATUserTodoViewModelTests {
    func test_loadData_networkServiceError() async {
        // Given
        networkServiceMock.error = .invalidUrl
        
        // When
        await sut.loadData()
        
        // Then
        XCTAssertEqual(sut.state, .error(message: "Something went wrong!"))
        XCTAssertTrue(sut.todos.isEmpty)
    }
    
    func test_loadData_networkServiceSuccess() async {
        // Given
        networkServiceMock.object.append([todo(), todo()])
        networkServiceMock.object.append(user())
        
        // When
        await sut.loadData()
        
        // Then
        XCTAssertEqual(sut.state, .loaded)
        XCTAssertEqual(sut.todos.count, 2)
        XCTAssertEqual(sut.userName, "name")
    }
}

// MARK: Business Logic
extension ATUserTodoViewModelTests {
    func test_onlyCompletedReturnedWhenRequested() {
        // Given
        sut.todos = [todo(), todo(), todo(true)]
        
        // Then
        XCTAssertEqual(sut.uncompletedTodos.count, 2)
    }
    
    func test_tappingTodo_changedCompletedState() {
        // Given
        sut.todos = [todo()]
        XCTAssertFalse(sut.todos.first!.completed)
        
        // When
        sut.didTap(todo: 1)
        
        // Then
        XCTAssertTrue(sut.todos.first!.completed)
    }
}

private extension ATUserTodoViewModelTests {
    func todo(_ isComplete: Bool = false) -> ATTodo {
        ATTodo(userId: 1, id: 1, title: "title", completed: isComplete)
    }
    
    func user() -> ATUser {
        ATUser(id: 1, name: "name", username: "username", email: "email", phone: "phone", website: "website", address: ATUser.ATAddreess(street: "street", suite: "suite", city: "city", zipcode: "zipcode", geo: ATUser.ATAddreess.ATCoordinates(lat: "lat", lng: "lng")), company: ATUser.ATCompany(name: "name", catchPhrase: "catchPhrase", bs: "bs"))
    }
}
