//
//  ATUsersHomeView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUIKit

struct ATUsersHomeView: View {
    
    @State var viewModel: ATUsersHomeViewModel
    
    var body: some View {
        ATLoadableView(state: $viewModel.state) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.users) { user in
                        VStack {
                            ATUserView(viewModel: ATUserViewModel(user: user))
                            HStack {
                                Button(String(localized: "Posts")) {
                                    viewModel.view(.posts, userId: user.id)
                                }
                                Button(String(localized: "Albums")) {
                                    viewModel.view(.albums, userId: user.id)
                                }
                            }
                            ATUserTodoView(viewModel: ATUserTodoViewModel(userId: user.id,
                                                                          networkService: viewModel.networkService))
                        }
                        .containerRelativeFrame(.horizontal)
                        .edgeFadeAnimation()
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
        }
        .navigationTitle("Contacts")
        .task {
            await viewModel.loadData()
        }
    }
}
