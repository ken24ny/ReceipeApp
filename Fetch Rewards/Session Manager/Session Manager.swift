//
//  Session Manager.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/16/21.
//

import Foundation

import Foundation
import UIKit

class SessionManager {
    
    var imagecache:NSCache<NSString, UIImage>
    
    static let shared = SessionManager(cache: NSCache<NSString, UIImage>())
    
    private init(cache: NSCache<NSString, UIImage>) {
        self.imagecache = cache
    }
    
    
    func getData<T: Decodable>(url: String, id: String,type: T.Type, completion: @escaping (Result<T,APIError>) -> Void) {
        
        guard let url = URL(string: url + id) else {
            completion(Result.failure(APIError.badURL))
            return
        }
        
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse,!(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse))
            } else if let data = data {
                
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(type, from: data)
                    
                    DispatchQueue.main.async {
                        completion(Result.success(response))
                    }
                } catch  {
                    completion(Result.failure(APIError.parsing))
                }
            }
        }
        session.resume()
    }
    
}
