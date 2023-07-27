//
//  ATExampleNetworkServiceInitialiser.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
import ATNetworking

public typealias ATExampleNetworkServiceProtocol = ATNetworkServiceProtocol

public class ATExampleNetworkServiceInitialiser {
    
    public init() {}
        
    public func networkService() -> ATNetworkServiceProtocol {
        ATNetworkingInitialiser().generateNetworkService()
    }
}
