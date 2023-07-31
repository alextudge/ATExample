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
    
    public init(viewModel: ATAlbumViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ATLoadableView(state: $viewModel.state) {
            
        }
        .navigationTitle(String(localized: "Albums"))
        .task {
            await viewModel.loadData()
        }
    }
}
