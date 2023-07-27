//
//  ATExampleNetworkServiceInitialiserTests.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import XCTest
@testable import ATNetworkingKit
@testable import ATNetworking

final class ATExampleNetworkServiceInitialiserTests: XCTestCase {
    
    var sut: ATExampleNetworkServiceInitialiser!
    
    override func setUp() {
        super.setUp()
        sut = ATExampleNetworkServiceInitialiser()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}

extension ATExampleNetworkServiceInitialiserTests {
    func testInitialiser_returnsConcreteInstance() {
        XCTAssertTrue(sut.networkService() is ATNetworkService)
    }
}
