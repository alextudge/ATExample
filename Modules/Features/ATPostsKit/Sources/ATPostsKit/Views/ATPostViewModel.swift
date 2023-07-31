//
//  ATPostViewModel.swift
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
public class ATPostViewModel {
    
    private var anyCancellables = Set<AnyCancellable>()
    private let networkService: ATExampleNetworkServiceProtocol
    let post: ATPost
    var comments = [ATComment]()
    var state = ATViewState.loaded
    var showingComments = false
    
    public init(networkService: ATExampleNetworkServiceProtocol,
                post: ATPost) {
        self.networkService = networkService
        self.post = post
    }
    
    func loadData() async {
        state = .loading
        networkService.request(endpoint: ATUsersEndpoint.postComments(postId: post.id), type: [ATComment].self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.state = .loaded
                case .failure(let failure):
                    self?.state = .error(message: failure.localizedDescription)
                }
            }, receiveValue: { [weak self] value in
                self?.comments = value
            }).store(in: &anyCancellables)
    }
}

extension ATPostViewModel: Equatable, Hashable {
    public static func == (lhs: ATPostViewModel, rhs: ATPostViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
