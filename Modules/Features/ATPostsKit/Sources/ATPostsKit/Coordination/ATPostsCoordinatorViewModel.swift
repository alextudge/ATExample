//
//  ATPostsCoordinatorViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Observation
import ATInterfacesKit
import ATNetworkingKit

@Observable
public class ATPostsCoordinatorViewModel: ATCoordinatorViewModel {
    
    public var navigationPath = NavigationPath()
    let networkService: ATExampleNetworkServiceProtocol
    
    public init(networkService: ATExampleNetworkServiceProtocol) {
        self.networkService = networkService
    }
}
