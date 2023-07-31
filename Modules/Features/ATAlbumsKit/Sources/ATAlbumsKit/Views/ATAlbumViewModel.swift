//
//  ATAlbumsViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import Combine
import Observation
import ATInterfacesKit
import ATDataModel
import ATNetworkingKit

@Observable
public class ATAlbumViewModel {
    
    var state = ATViewState.loaded
    private let networkService: ATExampleNetworkServiceProtocol
    private let album: ATAlbum
    var photos = [ATPhoto]()
        
    public init(networkService: ATExampleNetworkServiceProtocol,
                album: ATAlbum) {
        self.networkService = networkService
        self.album = album
    }
    
    func loadData() async {
        state = .loading
        do {
            photos = try await networkService.request(endpoint: ATUsersEndpoint.photos(albumId: album.id), type: [ATPhoto].self)
        } catch {
            state = .error(message: "!")
        }
    }
}

extension ATAlbumViewModel: Equatable, Hashable {
    public static func == (lhs: ATAlbumViewModel, rhs: ATAlbumViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
