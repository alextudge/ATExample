//
//  ATAlbumsViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI
import ATUIKit

public struct ATAlbumsView: View {
    
    @State var viewModel: ATAlbumsViewModel
    
    public var body: some View {
        ATLoadableView(state: $viewModel.state) {
            List {
                ForEach(viewModel.albums) { album in
                    VStack {
                        Text(album.title)
                        ATAlbumView(viewModel: ATAlbumViewModel(networkService: viewModel.networkService, album: album))
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
