//
//  ATPostsCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import ATUsersKit
import ATPostsKit

enum ATAppNavigationFlows: Hashable {
    case users(viewModel: ATUsersCoordinatorViewModel),
         posts(viewModel: ATPostsCoordinatorViewModel)
}
