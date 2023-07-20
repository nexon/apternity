//
//  ATYRegistryListViewModel.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

final class ATYRegistryListViewModel: ObservableObject {
    // MARK: - Private Properties
    
    @Published private(set) var registries: [ATYRegistryEntity]
    
    // MARK: - Public Properties
    
    // MARK: - Public Function(s)
    
    var isEmpty: Bool { registries.isEmpty }
    
    // MARK: - Private Function(s)
    
    init() {
        registries = []
    }
}
