//
//  MedicationFrequencyEntity.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

public enum MedicationFrequencyEntity: String, CaseIterable {
    case hourly
    case daily
    case weekly
    case monthly
    
    var title: String {
        switch self {
            
        case .hourly:
            return "Hourly"
        case .daily:
            return "Daily"
        case .weekly:
            return "Weekly"
        case .monthly:
            return "Monthly"
        }
    }
}
