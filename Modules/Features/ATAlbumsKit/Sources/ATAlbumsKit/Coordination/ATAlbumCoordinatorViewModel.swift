//
//  ATAlbumCoordinatorViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Combine
import Observation
import ATInterfacesKit
import ATNetworkingKit

@Observable
public class ATAlbumCoordinatorViewModel: ATCoordinatorViewModel {
    
    private let networkService: ATExampleNetworkServiceProtocol
    private let userId: Int
        
    public init(networkService: ATExampleNetworkServiceProtocol,
                userId: Int) {
        self.networkService = networkService
        self.userId = userId
    }
    
    func albumsViewModel() -> ATAlbumsViewModel {
        ATAlbumsViewModel(networkService: networkService, userId: userId)
    }
}
