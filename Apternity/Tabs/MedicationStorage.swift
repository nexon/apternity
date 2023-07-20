//
//  MedicationStorage.swift
//  apternity
//
//  Created by Alberto Lagos on 19-07-23.
//

import Combine
import CoreData
import Foundation

final class MedicationStorage: NSObject, ObservableObject {
    
    static let shared = MedicationStorage()
    
    var medications = CurrentValueSubject<[Medication], Never>([])
    private let medicationFetchController: NSFetchedResultsController<Medication>

    private override init() {
        let fetchRequest = Medication.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "created_at", ascending: false)]
        
        medicationFetchController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
                managedObjectContext: PersistenceController.shared.container.viewContext,
                sectionNameKeyPath: nil, cacheName: nil
        )

        super.init()

        medicationFetchController.delegate = self

        do {
            try medicationFetchController.performFetch()
            medications.value = medicationFetchController.fetchedObjects ?? []
        } catch {
            NSLog("Error: could not fetch objects")
        }
    }

    func add(entity: MedicationEntity) throws {
        let context = PersistenceController.shared.container.viewContext
        let newMedication = Medication(context: context)
        
        newMedication.id = entity.id
        newMedication.name = entity.medicationName
        newMedication.category = entity.category
        newMedication.instructions = entity.instructions
        newMedication.frequency = entity.frequency.rawValue
        newMedication.duration_start = entity.durationStart
        newMedication.duration_end = entity.durationEnd
        newMedication.reminder = entity.reminder
        newMedication.reminder_frequency = entity.reminderFrequency.rawValue
        newMedication.additional_notes = entity.additionalNotes
        newMedication.created_at = Date()
        
        try context.save()
    }

    func update() {
        // To implement
    }

    func delete(ids: [UUID]) throws {
        let context = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Medication> = Medication.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id IN %@", ids)
        
        let items = try context.fetch(fetchRequest)
        
        for item in items {
            context.delete(item)
        }
        
        try context.save()
    }
}

extension MedicationStorage: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let medications = controller.fetchedObjects as? [Medication] else { return }
        print("Context has changed, reloading courses")
        self.medications.value = medications
    }
}
