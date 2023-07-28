//
//  ATUsersCoordinatorViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATNetworkingKit
import ATInterfacesKit
import ATPostsKit
import Observation

public enum ATUsersCoordinatorEvents {
    case didRequestPosts
}

public protocol ATUsersCoordinatorViewModelCoordinatorDelegate: AnyObject {
    func didRequestPosts(userId: Int)
    func didRequestAlbums(userId: Int)
}

@Observable
public class ATUsersCoordinatorViewModel {
    
    let networkService: ATExampleNetworkServiceProtocol
    
    private weak var coordinatorDelegate: ATUsersCoordinatorViewModelCoordinatorDelegate?
    
    public init(networkService: ATExampleNetworkServiceProtocol,
                coordinatorDelegate: ATUsersCoordinatorViewModelCoordinatorDelegate) {
        self.networkService = networkService
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func userViewModel() -> ATUsersHomeViewModel {
        ATUsersHomeViewModel(networkService: networkService,
                             coordinatorDelegate: self)
    }
}

extension ATUsersCoordinatorViewModel: ATUsersHomeViewModelCoordinatorDelegate {
    func requestedPosts(userId: Int) {
        coordinatorDelegate?.didRequestPosts(userId: userId)
    }
    
    func requestedAlbums(userId: Int) {
        coordinatorDelegate?.didRequestAlbums(userId: userId)
    }
}

extension ATUsersCoordinatorViewModel: Equatable, Hashable {
    public static func == (lhs: ATUsersCoordinatorViewModel, rhs: ATUsersCoordinatorViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
