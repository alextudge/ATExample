//
//  ATUsersEndpoint.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import Foundation
import ATNetworking

public enum ATUsersEndpoint: ATEndpoint {
    
    case users,
         user(id: Int),
         todos(userId: Int),
         userPosts(userId: Int),
         postComments(postId: Int),
         usersAlbums(userId: Int)
    
    public var path: String {
        switch self {
        case .users:
            return "/users"
        case .user(let id):
            return "/users/\(id)"
        case .todos(let userId):
            return "/users/\(userId)/todos"
        case .userPosts(let userId):
            return "/users/\(userId)/posts"
        case .postComments(let postId):
            return "/posts/\(postId)/comments"
        case .usersAlbums(let userId):
            return "/users/\(userId)/albums"
        }
    }
    
    public var method: ATNetworking.ATHTTPMethod {
        .get
    }
    
    public var scheme: String {
        "https"
    }
    
    public var host: String {
        "jsonplaceholder.typicode.com"
    }
    
    public var headers: [String : String] {
        [:]
    }
    
    public var queries: [URLQueryItem] {
        []
    }
    
    public var parameters: Data? {
        nil
    }
}
