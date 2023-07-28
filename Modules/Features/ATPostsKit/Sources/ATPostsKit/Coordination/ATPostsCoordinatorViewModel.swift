//
//  ATPostsCoordinatorViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Combine
import Observation
import ATInterfacesKit
import ATNetworkingKit

public enum ATPostsCoordinatorEvents {
    case finished
}

@Observable
public class ATPostsCoordinatorViewModel {
    
    private let networkService: ATExampleNetworkServiceProtocol
    public private(set) var coordinatorDelegate = PassthroughSubject<ATPostsCoordinatorEvents, Never>()
    
    public init(networkService: ATExampleNetworkServiceProtocol) {
        self.networkService = networkService
    }
}

extension ATPostsCoordinatorViewModel: Equatable, Hashable {
    public static func == (lhs: ATPostsCoordinatorViewModel, rhs: ATPostsCoordinatorViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
