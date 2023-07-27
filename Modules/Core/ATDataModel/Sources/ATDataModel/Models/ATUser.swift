//
//  ATUser.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation

public struct ATUser: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let phone: String
    public let website: String
    public let address: ATAddreess
    public let company: ATCompany
    
    public struct ATAddreess: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        public let geo: ATCoordinates
        
        public struct ATCoordinates: Decodable {
            public let lat: String
            public let lng: String
        }
    }
    
    public struct ATCompany: Decodable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
}
