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
    
    public init(viewModel: ATPostViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ATLoadableView(state: $viewModel.state) {
            Text(viewModel.post.title)
                .padding()
                .containerRelativeFrame(.horizontal)
                .background(.quaternary)
                .cornerRadius(15)
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
                    .padding()
                    .containerRelativeFrame(.horizontal)
                    .background(.secondary)
                    .cornerRadius(15)
                }
            }
        }
        .navigationTitle(String(localized: "Posts"))
        .task {
            await viewModel.loadData()
        }
    }
}
