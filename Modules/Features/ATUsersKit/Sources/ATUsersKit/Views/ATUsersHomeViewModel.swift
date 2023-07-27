//
//  ATUsersHomeViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
import ATInterfacesKit
import ATDataModel
import ATNetworkingKit
import Observation

protocol ATUsersHomeViewModelCoordinatorDelegate: AnyObject {
    func requestedPosts(userId: Int)
    func requestedAlbums(userId: Int)
}

@Observable
class ATUsersHomeViewModel {
    
    enum UserNavigationType {
        case posts, albums
    }
    
    var state = ATViewState.loaded
    private(set) var users = [ATUser]()
    private(set) var networkService: ATExampleNetworkServiceProtocol
    
    private weak var coordinatorDelegate: ATUsersHomeViewModelCoordinatorDelegate?
    
    init(networkService: ATExampleNetworkServiceProtocol,
         coordinatorDelegate: ATUsersHomeViewModelCoordinatorDelegate) {
        self.networkService = networkService
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func loadData() {
        state = .loading
        Task {
            do {
                users = try await networkService.request(endpoint: ATUsersEndpoint.users, type: [ATUser].self)
                state = .loaded
            } catch {
                state = .error(message: "Something went wrong!")
            }
        }
    }
    
    func view(_ type: UserNavigationType, userId: Int) {
        switch type {
        case .posts:
            coordinatorDelegate?.requestedPosts(userId: userId)
        case .albums:
            coordinatorDelegate?.requestedAlbums(userId: userId)
        }
    }
}
