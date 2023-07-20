//
//  MedicationListViewModel.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Combine
import Foundation

final class MedicationListViewModel: ObservableObject {
    
    // MARK: - Enums
    
    enum ViewErrorType {
        case load
        case remove
    }
    
    // MARK: - Private Properties
    
    @Published private(set) var medications: [MedicationEntity]
    @Published var viewError: ViewError<ViewErrorType>?
    
    private let repository: MedicationRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public Properties
    
    // MARK: - Public Function(s)
    
    var isEmpty: Bool { medications.isEmpty }
    
    // MARK: - Private Function(s)
    
    init(repository: MedicationRepository = RemoteMedicationRepository()) {
        self.repository = repository
        medications = []
    }
    
    @MainActor
    func onLoad() {
        repository
            .read()
            .sink { error in
                print(error)                
            } receiveValue: { [weak self] entities in
                self?.medications = entities
            }
            .store(in: &cancellables)
    }
    
    @MainActor
    func onReset() {
        print("Reset!")
    }
    
    func onDelete(_ offsets: IndexSet) {
        do {
            let medications: [MedicationEntity] = Array(offsets).map { self.medications[$0] }
            try repository.remove(entities: medications)
        } catch {
            viewError = ViewError(error: error, errorType: .load)
        }
    }
    
    // MARK: - Private Function(S)
}
