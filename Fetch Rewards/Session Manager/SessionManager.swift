//
//  SessionManager.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/11/21.
//

import Foundation

class SessionManager {
    
    func fetchData(withID id: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: Constants.MEAL_DESCRIPTION_URL + id) else {
            print("Invalid URL!")
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil, let data = data else {   //could be done far better by checking error and response codes
                print("There was a data retriving error!")
                return
            }
            
            completion(data)
        }
        session.resume()
    }
    
}
