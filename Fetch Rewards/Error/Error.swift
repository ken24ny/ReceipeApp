//
//  Error.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/21/21.
//

import Foundation

//Custom error type for network request
enum APIError: Error {
    
    case badURL
    case url(URLError)
    case badResponse
    case parsing
    case unknown
    
    var localizedDescription: String {
        
        switch self {
        case .badURL:
            return "Cannot be converted to a valid URL"
        case .badResponse:
            return "Connection to the server failed"
        case.parsing:
            return "Parsing error"
        case .unknown:
            return "Unknown error"
        case .url:
            return "URL Session error"
        }
        
    }
    
}
