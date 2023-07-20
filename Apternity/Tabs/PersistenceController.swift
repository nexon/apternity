//
//  PersistenceController.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import CoreData
import Foundation

final class PersistenceController {
    
    static let shared = PersistenceController()
    
    let container = NSPersistentContainer(name: "apternity")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
