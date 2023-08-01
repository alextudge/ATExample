//
//  ATButton.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

public struct ATButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled
    
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(Color.white.opacity(configuration.isPressed ? 0.8 : 1))
            .padding()
            .background(.secondary)
            .opacity(isEnabled ? 1 : 0.8)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
