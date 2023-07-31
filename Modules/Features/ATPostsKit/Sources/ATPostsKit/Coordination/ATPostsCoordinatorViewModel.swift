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

public protocol ATPostsCoordinatorViewModelCoordinatorDelegate: AnyObject {
    func postsFlowDidFinish()
}

@Observable
public class ATPostsCoordinatorViewModel {
    
    private let networkService: ATExampleNetworkServiceProtocol
    private let userId: Int
    
    private weak var coordinatorDelegate: ATPostsCoordinatorViewModelCoordinatorDelegate?
    
    public init(networkService: ATExampleNetworkServiceProtocol,
                coordinatorDelegate: ATPostsCoordinatorViewModelCoordinatorDelegate,
                userId: Int) {
        self.networkService = networkService
        self.coordinatorDelegate = coordinatorDelegate
        self.userId = userId
    }
    
    func didTapClose() {
        coordinatorDelegate?.postsFlowDidFinish()
    }
    
    func postsViewModel() -> ATPostsViewModel {
        ATPostsViewModel(networkService: networkService, userId: userId)
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
