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
    
    var navigationPath = NavigationPath()
    private let networkService: ATExampleNetworkServiceProtocol
    private var anyCancelleables = Set<AnyCancellable>()
    
    init(networkService: ATExampleNetworkServiceProtocol = ATExampleNetworkServiceInitialiser().networkService()) {
        self.networkService = networkService
    }
    
    func usersCoordinatorViewModel() -> ATUsersCoordinatorViewModel {
        let viewModel = ATUsersCoordinatorViewModel(networkService: networkService)
        viewModel.coordinatorDelegate
            .sink(receiveValue: { [weak self] value in
                guard let self else { return }
                switch value {
                case .didRequestPosts:
                    self.navigationPath.append(ATAppNavigationFlows.posts(viewModel: self.postsCoordinatorViewModel()))
                }
            })
            .store(in: &anyCancelleables)
        return viewModel
    }
}

private extension ATAppNavigationCoordinatorViewModel {
    func postsCoordinatorViewModel() -> ATPostsCoordinatorViewModel {
        let viewModel = ATPostsCoordinatorViewModel(networkService: networkService)
        viewModel.coordinatorDelegate
            .sink(receiveValue: { value in
                print(value)
            })
            .store(in: &anyCancelleables)
        return viewModel
    }
}
