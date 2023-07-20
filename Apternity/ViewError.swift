//
//  ViewError.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

struct ViewError<T: Hashable & Equatable>: LocalizedError, Equatable {
    
    let errorType: T
    
    var errorDescription: String? = "Error"
    var failureReason: String?
    
    // MARK: - Initializer
    
    public init(failureReason: String?, errorType: T) {
        self.failureReason = failureReason
        self.errorType = errorType
    }
    
    public init(error: Error, errorType: T) {
        self.init(failureReason: error.localizedDescription, errorType: errorType)
    }
    
    public init(error: Error, errorType: T, errorDescription: String) {
        self.init(failureReason: error.localizedDescription, errorType: errorType)
        self.errorDescription = errorDescription
    }
    
    public init(localizedError: LocalizedError, errorType: T) {
        self.init(failureReason: localizedError.failureReason, errorType: errorType)
    }
}
