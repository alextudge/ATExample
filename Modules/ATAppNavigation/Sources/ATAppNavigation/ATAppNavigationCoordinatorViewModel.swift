//
//  ATAppNavigationCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Observation
import ATUsersKit
import ATPostsKit
import ATAlbumsKit
import ATInterfacesKit
import ATNetworkingKit

@Observable
class ATAppNavigationCoordinatorViewModel {
    
    var navigationPath: NavigationPath
    private let networkService: ATExampleNetworkServiceProtocol
    
    init(navigationPath: NavigationPath = NavigationPath(),
         networkService: ATExampleNetworkServiceProtocol = ATExampleNetworkServiceInitialiser().networkService()) {
        self.navigationPath = navigationPath
        self.networkService = networkService
    }
    
    func usersCoordinatorViewModel() -> ATUsersCoordinatorViewModel {
        let viewModel = ATUsersCoordinatorViewModel(networkService: networkService,
                                                    coordinatorDelegate: self,
                                                    navigationPath: Binding(get: {
            self.navigationPath
        }, set: { value in
            self.navigationPath = value
        } ))
        return viewModel
    }
}

private extension ATAppNavigationCoordinatorViewModel {
    func postsCoordinatorViewModel(userId: Int) -> ATPostsCoordinatorViewModel {
        let viewModel = ATPostsCoordinatorViewModel(networkService: networkService,
                                                    coordinatorDelegate: self,
                                                    userId: userId)
        return viewModel
    }
    
    func albumsCoordinatorViewModel(userId: Int) -> ATAlbumCoordinatorViewModel {
        let viewModel = ATAlbumCoordinatorViewModel(networkService: networkService,
                                                    userId: userId)
        return viewModel
    }
}

extension ATAppNavigationCoordinatorViewModel: ATUsersCoordinatorViewModelCoordinatorDelegate {
    func didRequestAlbums(userId: Int) {
        navigationPath.append(ATAppNavigationFlows.albums(viewModel: albumsCoordinatorViewModel(userId: userId)))
    }
    
    func didRequestPosts(userId: Int) {
        navigationPath.append(ATAppNavigationFlows.posts(viewModel: postsCoordinatorViewModel(userId: userId)))
    }
}

extension ATAppNavigationCoordinatorViewModel: ATPostsCoordinatorViewModelCoordinatorDelegate {
    func postsFlowDidFinish() {
        navigationPath.removeLast()
    }
}
