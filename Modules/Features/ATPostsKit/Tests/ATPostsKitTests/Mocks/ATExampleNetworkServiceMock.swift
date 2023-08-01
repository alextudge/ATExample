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

class ATExampleNetworkServiceMock: ATExampleNetworkServiceProtocol {
    
    var error: ATError?
    var object = [Any]()
    
    func request<T>(endpoint: ATNetworking.ATEndpoint, type: T.Type, completion: @escaping (Result<T, ATNetworking.ATError>) -> Void) where T : Decodable {
        if let object = object.first(where: { $0 is T }) as? T {
            completion(.success(object))
        } else {
            completion(.failure(error ?? ATError.unauthorised))
        }
    }
    
    func request<T>(endpoint: ATNetworking.ATEndpoint, type: T.Type) -> AnyPublisher<T, ATNetworking.ATError> where T : Decodable {
        if let object = object.first(where: { $0 is T }) as? T {
            return Just(object)
                .setFailureType(to: ATError.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: error ?? ATError.invalidUrl)
                .eraseToAnyPublisher()
        }
    }
    
    func request<T>(endpoint: ATNetworking.ATEndpoint, type: T.Type) async throws -> T where T : Decodable {
        if let object = object.first(where: { $0 is T }) as? T {
            return object
        } else {
            throw error ?? ATError.invalidUrl
        }
    }
}
