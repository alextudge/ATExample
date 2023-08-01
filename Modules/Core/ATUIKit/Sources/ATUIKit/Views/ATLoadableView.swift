//
//  ATLoadableView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

public enum ATViewState: Equatable {
    case loading,
         error(message: String?),
         loaded
}

public struct ATLoadableView<Content>: View where Content: View {
    
    @Binding var state: ATViewState
    let content: Content
    
    public init(state: Binding<ATViewState>,
         @ViewBuilder content: () -> Content) {
        self._state = state
        self.content = content()
    }
    
    public var body: some View {
        Group {
            switch state {
            case .loading:
                ProgressView()
            case .error(let message):
                Text(message ?? String(localized: "Something went wrong!"))
            case .loaded:
                content
            }
        }
        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.25)))
    }
}
