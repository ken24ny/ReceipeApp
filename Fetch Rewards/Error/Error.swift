//
//  Error.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/21/21.
//

import Foundation

enum APIError: Error {
    case badURL
    case url(URLError)
    case badResponse
    case parsing
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .badURL,.parsing:
            return "Somthing went wrong"
        case .badResponse:
            return "Connection to the server failed"
            
        case .unknown:
            return "Unknown error"
            
        case .url:
            return "URL Session error"
        }
        
    }
    
}
