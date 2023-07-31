//
//  ATPostsCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

public struct ATPostsCoordinatorView: View {
    
    @State private var coordinatorViewModel: ATPostsCoordinatorViewModel
    
    public init(viewModel: ATPostsCoordinatorViewModel) {
        self.coordinatorViewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            ATPostsView(viewModel: coordinatorViewModel.postsViewModel())
        }
        .navigationDestination(for: ATPostsScreens.self) { screen in
            switch screen {
            case .posts(let viewModel):
                ATPostsView(viewModel: viewModel)
            }
        }
    }
}
