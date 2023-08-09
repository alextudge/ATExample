//
//  ATExampleNetworkServiceMock.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
import Combine
@testable import ATNetworking
@testable import ATNetworkingKit
@testable import ATUsersKit

class ATExampleNetworkServiceMock: ATExampleNetworkServiceProtocol {
    func request<T>(endpoint: ATNetworking.ATEndpoint, type: T.Type, completion: @escaping (Result<T, ATNetworking.ATError>) -> Void) where T : Decodable {
        completion(.failure(ATError.invalidUrl))
    }
    
    func request<T>(endpoint: ATNetworking.ATEndpoint, type: T.Type) -> AnyPublisher<T, ATNetworking.ATError> where T : Decodable {
        Fail(error: ATError.invalidUrl)
            .eraseToAnyPublisher()
    }
    
    func request<T>(endpoint: ATNetworking.ATEndpoint, type: T.Type) async throws -> T where T : Decodable {
        throw ATError.invalidUrl
    }
    
    func request(endpoint: ATNetworking.ATEndpoint, completion: @escaping (Result<Data, ATNetworking.ATError>) -> Void) {
        completion(.failure(ATError.invalidUrl))
    }
    
    func request(endpoint: ATNetworking.ATEndpoint) -> AnyPublisher<Data, ATNetworking.ATError> {
        Fail(error: ATError.invalidUrl)
            .eraseToAnyPublisher()
    }
    
    func request(endpoint: ATNetworking.ATEndpoint) async throws -> Data {
        throw ATError.invalidUrl
    }
}
