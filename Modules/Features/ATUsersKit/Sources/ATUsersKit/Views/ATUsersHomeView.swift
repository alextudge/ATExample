//
//  ATUsersHomeView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATDataModel
import ATUIKit

struct ATUsersHomeView: View {
    
    @State var viewModel: ATUsersHomeViewModel
    
    var body: some View {
        ATLoadableView(state: $viewModel.state) {
            ScrollView(.horizontal) {
                LazyHStack {
                    userCardCarousel()
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
        }
        .navigationTitle(String(localized: "Contacts"))
        .task {
            await viewModel.loadData()
        }
    }
}

private extension ATUsersHomeView {
    func userCardCarousel() -> some View {
        ForEach(viewModel.users) { user in
            VStack {
                ATUserView(viewModel: ATUserViewModel(user: user))
                buttons(for: user.id)
            }
            .containerRelativeFrame(.horizontal)
            .edgeFadeAnimation(axis: .horizontal)
        }
    }
    
    func buttons(for userId: Int) -> some View {
        HStack {
            ForEach(ATUserNavigationOptions.allCases, id: \.self) { option in
                Button {
                    viewModel.view(option, userId: userId)
                } label: {
                    Label(option.title, systemImage: option.icon)
                }
            }
        }
        .buttonStyle(ATButtonStyle())
    }
}
