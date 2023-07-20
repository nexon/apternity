//
//  Optional+String.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

extension Optional where Wrapped == String {
    var unwrapped: String {
        guard let value = self else { return "" }
        return value
    }
}
