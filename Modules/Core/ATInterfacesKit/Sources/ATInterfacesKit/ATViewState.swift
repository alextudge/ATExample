//
//  File.swift
//  
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public enum ATViewState {
    case loading,
         error(message: String),
         loaded
}