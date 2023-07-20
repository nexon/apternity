//
//  AddMedicationRepository.swift
//  apternity
//
//  Created by Alberto Lagos on 19-07-23.
//

import Foundation

protocol AddMedicationRepository {
    func save(entity: MedicationEntity) throws
}
