//
//  ATPostsView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUIKit

struct ATPostsView: View {
    
    @State var viewModel: ATPostsViewModel
    
    public init(viewModel: ATPostsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ATLoadableView(state: $viewModel.state) {
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        ATPostView(viewModel: ATPostViewModel(networkService: viewModel.networkService, post: post))
                    }
                }
            }.padding(.horizontal)
        }
        .navigationTitle(String(localized: "Posts"))
        .task {
            await viewModel.loadData()
        }
    }
}
