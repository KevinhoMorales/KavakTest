//
//  Extensions.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import Foundation

extension String {
    var forSorting: String {
        let simple = folding(options: [.diacriticInsensitive, .widthInsensitive, .caseInsensitive], locale: nil)
        let nonAlphaNumeric = CharacterSet.alphanumerics.inverted
        return simple.components(separatedBy: nonAlphaNumeric).joined(separator: "")
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}
