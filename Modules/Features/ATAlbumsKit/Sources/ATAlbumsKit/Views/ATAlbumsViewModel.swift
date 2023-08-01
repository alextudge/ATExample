//
//  ATAlbumsViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Observation
import ATUIKit
import ATInterfacesKit
import ATDataModel
import ATNetworkingKit

@Observable
public class ATAlbumsViewModel {
    
    var state = ATViewState.loaded
    let networkService: ATExampleNetworkServiceProtocol
    private let userId: Int
    private(set) var albums = [ATAlbum]()
        
    public init(networkService: ATExampleNetworkServiceProtocol,
                userId: Int) {
        self.networkService = networkService
        self.userId = userId
    }
    
    func loadData() async {
        state = .loading
        do {
            albums = try await networkService.request(endpoint: ATUsersEndpoint.usersAlbums(userId: userId), type: [ATAlbum].self)
            state = .loaded
        } catch {
            state = .error(message: "!")
        }
    }
}

extension ATAlbumsViewModel: Equatable, Hashable {
    public static func == (lhs: ATAlbumsViewModel, rhs: ATAlbumsViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
