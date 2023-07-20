//
//  RemoteMedicationRepository.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Combine
import Foundation

final class RemoteMedicationRepository: MedicationRepository {
    
    // MARK: - Private Properties
    
    // MARK: - Public Function(s)
    
    func read() -> AnyPublisher<[MedicationEntity], Error> {
        MedicationStorage
            .shared
            .medications
            .map { medications in
                medications.map(\.local_entity)
            }
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func remove(entities: [MedicationEntity]) throws {
        try MedicationStorage.shared.delete(ids: entities.map(\.id))
    }
}

// MARK: - Medication

extension Medication {
    public var local_entity: MedicationEntity {
        MedicationEntity(id: id.unwrapped(with: UUID()),
                         medicationName: name.unwrapped,
                         category: category.unwrapped,
                         instructions: instructions.unwrapped,
                         frequency: MedicationFrequencyEntity(rawValue: reminder_frequency.unwrapped).unwrapped(with: .daily),
                         additionalNotes: additional_notes.unwrapped,
                         durationStart: duration_start.unwrapped(with: Date()),
                         durationEnd: duration_end.unwrapped(with: Date()),
                         reminder: reminder,
                         reminderFrequency: MedicationFrequencyEntity(rawValue: reminder_frequency.unwrapped).unwrapped(with: .daily))
    }
}
