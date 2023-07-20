//
//  ATYReminderTabViewModel.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

final class ATYReminderListViewModel: ObservableObject {
    // MARK: - Private Properties
    
    @Published private(set) var reminders: [ATYReminderEntity]
    
    // MARK: - Public Properties
    
    // MARK: - Public Function(s)
    
    var isEmpty: Bool { reminders.isEmpty }
    
    // MARK: - Private Function(s)
    
    init() {
        reminders = []
    }
}
