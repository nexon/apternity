//
//  MedicationInstructionEntity.swift
//  apternity
//
//  Created by Alberto Lagos on 17-07-23.
//

import Foundation

public struct MedicationInstructionEntity: Equatable, Hashable {
    public let dosage: MedicationDosageEntity
    public let frequency: MedicationFrequencyEntity
    public let duration: String
    public var additionalNotes: String
}
