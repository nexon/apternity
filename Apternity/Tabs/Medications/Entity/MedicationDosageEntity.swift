//
//  MedicationDosageEntity.swift
//  apternity
//
//  Created by Alberto Lagos on 17-07-23.
//

import Foundation

public struct MedicationDosageEntity: Hashable, Equatable {
    public let amount: Double
    public let unit: MedicationDosageUnitEntity
}
