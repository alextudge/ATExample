//
//  ATAppNavigationCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Combine
import Observation
import ATUsersKit
import ATPostsKit
import ATInterfacesKit
import ATNetworkingKit

@Observable
class ATAppNavigationCoordinatorViewModel {
    
    var navigationPath: NavigationPath
    private let networkService: ATExampleNetworkServiceProtocol
    private var anyCancelleables = Set<AnyCancellable>()
    
    init(navigationPath: NavigationPath = NavigationPath(),
         networkService: ATExampleNetworkServiceProtocol = ATExampleNetworkServiceInitialiser().networkService()) {
        self.navigationPath = navigationPath
        self.networkService = networkService
    }
    
    func usersCoordinatorViewModel() -> ATUsersCoordinatorViewModel {
        let viewModel = ATUsersCoordinatorViewModel(networkService: networkService,
                                                    coordinatorDelegate: self)
        return viewModel
    }
}

private extension ATAppNavigationCoordinatorViewModel {
    func postsCoordinatorViewModel() -> ATPostsCoordinatorViewModel {
        let viewModel = ATPostsCoordinatorViewModel(networkService: networkService,
                                                    coordinatorDelegate: self)
        return viewModel
    }
}

extension ATAppNavigationCoordinatorViewModel: ATUsersCoordinatorViewModelCoordinatorDelegate {
    func didRequestAlbums(userId: Int) {
        return
    }
    
    func didRequestPosts(userId: Int) {
        navigationPath.append(ATAppNavigationFlows.posts(viewModel: postsCoordinatorViewModel()))
    }
}

extension ATAppNavigationCoordinatorViewModel: ATPostsCoordinatorViewModelCoordinatorDelegate {
    func postsFlowDidFinish() {
        navigationPath.removeLast()
    }
}
