//
//  ATUsersHomeViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
import ATUIKit
import ATInterfacesKit
import ATDataModel
import ATNetworkingKit
import Observation

protocol ATUsersHomeViewModelCoordinatorDelegate: AnyObject {
    func requested(view type: ATUserNavigationOptions, userId: Int)
}

@Observable
class ATUsersHomeViewModel: ATCoordinatorViewModel {
    
    var state = ATViewState.loaded
    private(set) var users = [ATUser]()
    private(set) var networkService: ATExampleNetworkServiceProtocol
    
    private weak var coordinatorDelegate: ATUsersHomeViewModelCoordinatorDelegate?
    
    init(networkService: ATExampleNetworkServiceProtocol,
         coordinatorDelegate: ATUsersHomeViewModelCoordinatorDelegate) {
        self.networkService = networkService
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func loadData() async {
        state = .loading
        do {
            users = try await networkService.request(endpoint: ATUsersEndpoint.users, type: [ATUser].self)
            state = .loaded
        } catch {
            state = .error(message: String(localized: "Something went wrong!"))
        }
    }
    
    func view(_ type: ATUserNavigationOptions, userId: Int) {
        coordinatorDelegate?.requested(view: type, userId: userId)
    }
}
