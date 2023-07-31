//
//  ATAlbumCoordinatorView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

public struct ATAlbumCoordinatorView: View {
    
    @State private var coordinatorViewModel: ATAlbumCoordinatorViewModel
    
    public init(viewModel: ATAlbumCoordinatorViewModel) {
        self.coordinatorViewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            ATAlbumsView(viewModel: coordinatorViewModel.albumsViewModel())
        }
        .navigationDestination(for: ATAlbumScreens.self) { screen in
            switch screen {
            case .albums(let viewModel):
                ATAlbumsView(viewModel: viewModel)
            }
        }
    }
}
