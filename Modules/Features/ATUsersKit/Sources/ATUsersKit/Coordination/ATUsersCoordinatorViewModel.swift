//
//  ATUsersCoordinatorViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Combine
import ATNetworkingKit
import ATInterfacesKit
import ATPostsKit
import Observation

public enum ATUsersCoordinatorEvents {
    case didRequestPosts
}

@Observable
public class ATUsersCoordinatorViewModel {
    
    public var navigationPath: NavigationPath
    let networkService: ATExampleNetworkServiceProtocol
    public private(set) var coordinatorDelegate = PassthroughSubject<ATUsersCoordinatorEvents, Never>()
    
    public init(networkService: ATExampleNetworkServiceProtocol,
                navigationPath: NavigationPath) {
        self.networkService = networkService
        self.navigationPath = navigationPath
    }
    
    func userViewModel() -> ATUsersHomeViewModel {
        ATUsersHomeViewModel(networkService: networkService,
                             coordinatorDelegate: self)
    }
}

extension ATUsersCoordinatorViewModel: ATUsersHomeViewModelCoordinatorDelegate {
    func requestedPosts(userId: Int) {
        coordinatorDelegate.send(.didRequestPosts)
    }
    
    func requestedAlbums(userId: Int) {
        
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
