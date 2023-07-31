//
//  ATPostsViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Combine
import Observation
import ATDataModel
import ATInterfacesKit
import ATNetworkingKit

@Observable
public class ATPostsViewModel {
    
    let networkService: ATExampleNetworkServiceProtocol
    private let userId: Int
    var state = ATViewState.loaded
    private(set) var posts = [ATPost]()
    
    public init(networkService: ATExampleNetworkServiceProtocol,
                userId: Int) {
        self.networkService = networkService
        self.userId = userId
    }
    
    func loadData() async {
        state = .loading
        do {
            posts = try await networkService.request(endpoint: ATUsersEndpoint.userPosts(userId: userId), type: [ATPost].self)
            state = .loaded
        } catch {
            state = .error(message: String(localized: "Something went wrong!"))
        }
    }
}

extension ATPostsViewModel: Equatable, Hashable {
    public static func == (lhs: ATPostsViewModel, rhs: ATPostsViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
