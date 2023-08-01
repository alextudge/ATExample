//
//  ATUsersCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

public struct ATUsersCoordinatorView: View {
    
    @State private var viewModel: ATUsersCoordinatorViewModel
    
    public init(viewModel: ATUsersCoordinatorViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            ATUsersHomeView(viewModel: viewModel.userViewModel())
        }
        .navigationDestination(for: ATUsersScreens.self) { screen in
            switch screen {
            case .home(let homeViewModel):
                ATUsersHomeView(viewModel: homeViewModel)
            case .tasks(let viewModel):
                ATUserTodoView(viewModel: viewModel)
            }
        }
    }
}
