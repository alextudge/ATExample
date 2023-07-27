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

@Observable
class ATUsersCoordinatorViewModel: ATCoordinatorViewModel {
    
    var navigationPath = NavigationPath()
    let networkService: ATExampleNetworkServiceProtocol
    
    init(networkService: ATExampleNetworkServiceProtocol = ATExampleNetworkServiceInitialiser().networkService()) {
        self.networkService = networkService
    }
    
    func userViewModel() -> ATUsersHomeViewModel {
        ATUsersHomeViewModel(networkService: networkService,
                             coordinatorDelegate: self)
    }
    
    func postsCoordinatorViewModel() -> ATPostsCoordinatorViewModel {
        ATPostsCoordinatorViewModel(networkService: networkService)
    }
}

extension ATUsersCoordinatorViewModel: ATUsersHomeViewModelCoordinatorDelegate {
    func requestedPosts(userId: Int) {
        navigationPath.append(ATUsersScreens.postsCoordinator)
    }
    
    func requestedAlbums(userId: Int) {
        
    }
}
