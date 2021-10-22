//
//  Extensions.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/21/21.
//

import Foundation

extension String {
    func emptyAsNil() -> String? {
        self.isEmpty ? nil : self
    }
    
    func trimTrailingWhitespaces() -> String {
        return self.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    }
}


