//
//  MedicationListRowViewModel.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

final class MedicationListRowViewModel: ObservableObject {
    // MARK: - Private Properties
    
    private let entity: MedicationEntity
    
    // MARK: - Public Properties
    
    var name: String { entity.medicationName }
    
    // MARK: - Public Function(s)
    
    // MARK: - Private Function(s)
    
    init(entity: MedicationEntity) {
        self.entity = entity
    }
}

// MARK: - <Equatable>

extension MedicationListRowViewModel: Equatable {
    static func == (lhs: MedicationListRowViewModel, rhs: MedicationListRowViewModel) -> Bool {
        lhs.entity == rhs.entity
    }
}

// MARK: - <Hashable>

extension MedicationListRowViewModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(entity)
    }
}
