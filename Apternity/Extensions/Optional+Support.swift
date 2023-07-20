//
//  Optional+Support.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

extension Optional {
    func unwrapped(with defaultValue: Wrapped) -> Wrapped {
        guard let value = self else { return defaultValue }
        return value
    }
}
