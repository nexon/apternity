//
//  MedicationRepository.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Combine
import Foundation

protocol MedicationRepository {
    func read() -> AnyPublisher<[MedicationEntity], Error>
    func remove(entities: [MedicationEntity]) throws
}
