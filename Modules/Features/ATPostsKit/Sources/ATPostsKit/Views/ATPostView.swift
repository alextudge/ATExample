//
//  ATPostView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUIKit

struct ATPostView: View {
    
    @State var viewModel: ATPostViewModel
    
    var body: some View {
        ATLoadableView(state: $viewModel.state) {
            Text(viewModel.post.title)
                .roundedContainer(Color.green)
            Button {
                viewModel.showingComments.toggle()
            } label: {
                Label("\(viewModel.comments.count)", systemImage: viewModel.showingComments ? "message.fill" : "message")
            }
            if viewModel.showingComments {
                ForEach(viewModel.comments) { comment in
                    VStack(alignment: .leading) {
                        Text(comment.body)
                        Text(comment.email)
                            .font(.footnote)
                    }
                    .roundedContainer(Color.mint)
                }
            }
        }
        .navigationTitle(String(localized: "Posts"))
        .task {
            await viewModel.loadData()
        }
    }
}
