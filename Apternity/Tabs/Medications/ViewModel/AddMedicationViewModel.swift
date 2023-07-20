//
//  AddMedicationViewModel.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Combine
import Foundation

final class AddMedicationViewModel: ObservableObject {
    
    // MARK: - Enums
    
    enum ViewErrorType {
        case save
    }
    
    enum State<E: Hashable & Equatable> {
        case idle
        case save
        case error(ViewError<E>)
    }
    
    // MARK: - Private Properties
    
    private let repository: AddMedicationRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public Properties
    
    @Published var medicationName: String = ""
     
    @Published var category: String = ""
    
    @Published var instructions: String = ""
    
    @Published var frequency: MedicationFrequencyEntity = .daily
    
    @Published var durationStart: Date = Date()
    
    @Published var durationEnd: Date = Date()
    
    @Published var reminder: Bool = false
    
    @Published var reminderFrequency: MedicationFrequencyEntity = .daily
    
    @Published var additionalNotes: String = ""
    
    @Published private(set) var state: State<ViewErrorType> = .idle
    
    init(repository: AddMedicationRepository) {
        self.repository = repository
    }
    
    func onSave() {
        do {
            try repository.save(entity: .init(id: UUID(),
                                              medicationName: medicationName,
                                              category: category,
                                              instructions: instructions,
                                              frequency: frequency,
                                              additionalNotes: additionalNotes,
                                              durationStart: durationStart,
                                              durationEnd: durationEnd,
                                              reminder: reminder,
                                              reminderFrequency: reminderFrequency))
        } catch {
            state = .error(ViewError(error: error, errorType: ViewErrorType.save))
        }
    }
}
