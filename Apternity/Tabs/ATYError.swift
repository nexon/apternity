//
//  ATYError.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation
 
enum ATYError: Error {
    case save
    case load
}

// MARK: - <ATYError>

extension ATYError: LocalizedError {
    
}
