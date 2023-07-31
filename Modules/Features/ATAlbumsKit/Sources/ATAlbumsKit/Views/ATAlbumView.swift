//
//  ATAlbumView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUIKit

public struct ATAlbumView: View {
    
    @State var viewModel: ATAlbumViewModel
    
    public var body: some View {
        ATLoadableView(state: $viewModel.state) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.photos) { photo in
                        AsyncImage(url: URL(string: photo.url)!, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }, placeholder: {
                            ProgressView()
                        }).frame(width: 100, height: 100)
                    }
                }
            }
        }
        .navigationTitle(String(localized: "Albums"))
        .task {
            await viewModel.loadData()
        }
    }
}
