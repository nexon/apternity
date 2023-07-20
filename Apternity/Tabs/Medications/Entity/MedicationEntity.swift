//
//  MedicationEntity.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

public struct MedicationEntity: Identifiable {
    
    public var id: UUID
    
    let medicationName: String
    
    let category: String
    
//    let instruction: MedicationInstructionEntity
    
    // Instruction separated for now
    
    let instructions: String
    
    let frequency: MedicationFrequencyEntity
    
    let additionalNotes: String
    
    let durationStart: Date
    
    let durationEnd: Date
    
    let reminder: Bool
    
    let reminderFrequency: MedicationFrequencyEntity
}

// MARK: - <Hashable>

extension MedicationEntity: Hashable {}

// MARK: - <Equatable>

extension MedicationEntity: Equatable {}
