//
//  ATPostsCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

public struct ATPostsCoordinatorView: View {
    
    @Bindable private var viewModel: ATPostsCoordinatorViewModel
    
    public init(viewModel: ATPostsCoordinatorViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack() {
                ATPostsView()
            }
            .navigationDestination(for: ATPostsScreens.self) { screen in
                switch screen {
                case .posts:
                    ATPostsView()
                }
            }
        }
    }
}
