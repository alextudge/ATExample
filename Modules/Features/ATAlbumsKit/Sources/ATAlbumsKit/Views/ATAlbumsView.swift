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
    
    public init(viewModel: ATAlbumsViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ATLoadableView(state: $viewModel.state) {
            List {
                ForEach(viewModel.albums) {
                    Text($0.title)
                }
            }
        }
        .navigationTitle(String(localized: "Albums"))
        .task {
            await viewModel.loadData()
        }
    }
}
