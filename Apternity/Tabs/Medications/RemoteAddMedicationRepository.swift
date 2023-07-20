//
//  RemoteAddMedicationRepository.swift
//  apternity
//
//  Created by Alberto Lagos on 19-07-23.
//

import Foundation

final class RemoteAddMedicationRepository: AddMedicationRepository {
    func save(entity: MedicationEntity) throws {
        try MedicationStorage.shared.add(entity: entity)
    }
}
