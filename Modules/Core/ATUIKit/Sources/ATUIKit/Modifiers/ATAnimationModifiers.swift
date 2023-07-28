//
//  ATAnimationModifiers.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

public extension View {
    func edgeFadeAnimation(axis: Axis) -> some View {
        self.scrollTransition(.animated.threshold(.visible(0.9)), axis: axis) { content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0.75)
                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                .blur(radius: phase.isIdentity ? 0 : 2)
        }
    }
}
