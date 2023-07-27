//
//  ATUserViewModel.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
import ATDataModel
import Observation

@Observable
class ATUserViewModel {
    
    let user: ATUser
    
    init(user: ATUser) {
        self.user = user
    }
}
