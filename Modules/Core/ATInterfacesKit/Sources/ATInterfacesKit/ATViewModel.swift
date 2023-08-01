//
//  ATViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public protocol ATCoordinatorViewModel: Equatable, Hashable where Self: AnyObject {}

public extension ATCoordinatorViewModel {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
