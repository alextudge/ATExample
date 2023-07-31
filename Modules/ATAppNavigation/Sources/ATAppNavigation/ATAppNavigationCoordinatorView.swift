//
//  ATAppNavigationCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUsersKit
import ATPostsKit
import ATAlbumsKit

public struct ATAppNavigationCoordinatorView: View {
    
    @Bindable var coordinatorViewModel = ATAppNavigationCoordinatorViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $coordinatorViewModel.navigationPath) {
            VStack {
                ATUsersCoordinatorView(viewModel: coordinatorViewModel.usersCoordinatorViewModel())
            }
            .navigationDestination(for: ATAppNavigationFlows.self) { screen in
                switch screen {
                case .users(let viewModel):
                    ATUsersCoordinatorView(viewModel: viewModel)
                case .posts(let viewModel):
                    ATPostsCoordinatorView(viewModel: viewModel)
                case .albums(let viewModel):
                    ATAlbumCoordinatorView(viewModel: viewModel)
                }
            }
        }
    }
}
