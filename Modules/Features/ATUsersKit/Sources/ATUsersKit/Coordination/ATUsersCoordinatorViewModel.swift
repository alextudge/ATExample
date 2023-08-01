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
public class ATUsersCoordinatorViewModel: ATCoordinatorViewModel {
    
    var navigationPath: Binding<NavigationPath>
    private let networkService: ATExampleNetworkServiceProtocol
    
    private weak var coordinatorDelegate: ATUsersCoordinatorViewModelCoordinatorDelegate?
    
    public init(networkService: ATExampleNetworkServiceProtocol,
                coordinatorDelegate: ATUsersCoordinatorViewModelCoordinatorDelegate,
                navigationPath: Binding<NavigationPath>) {
        self.networkService = networkService
        self.coordinatorDelegate = coordinatorDelegate
        self.navigationPath = navigationPath
    }
    
    func userViewModel() -> ATUsersHomeViewModel {
        ATUsersHomeViewModel(networkService: networkService,
                             coordinatorDelegate: self)
    }
}

extension ATUsersCoordinatorViewModel: ATUsersHomeViewModelCoordinatorDelegate {
    func requested(view type: ATUserNavigationOptions, userId: Int) {
        switch type {
        case .posts:
            coordinatorDelegate?.didRequestPosts(userId: userId)
        case .albums:
            coordinatorDelegate?.didRequestAlbums(userId: userId)
        case .tasks:
            navigationPath.wrappedValue.append(ATUsersScreens.tasks(viewModel: ATUserTodoViewModel(userId: userId,
                                                                                                   networkService: networkService)))
        }
    }
}
