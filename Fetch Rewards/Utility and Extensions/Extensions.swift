//
//  Extensions.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/21/21.
//

import Foundation


//String extension
// emptyasNil used in the decoding process
// trimTrailingWhiteSpaces used in the MealDetailViewController
extension String {
    func emptyAsNil() -> String? {
        self.isEmpty ? nil : self
    }
    
    func trimTrailingWhitespaces() -> String {
        return self.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    }
}


