//
//  MedicationDoseForm.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

enum MedicationDoseForm: Hashable {
    case oral([MedicationDoseFormSubtype])
    case topical([MedicationDoseFormSubtype])
    case intravenous([MedicationDoseFormSubtype])
    case intramuscular([MedicationDoseFormSubtype])
    case subcutaneous([MedicationDoseFormSubtype])
    case inhaled([MedicationDoseFormSubtype])
    case rectal([MedicationDoseFormSubtype])
    case intradermal([MedicationDoseFormSubtype])
    
    static var allDoses: [MedicationDoseForm] {
        [
            .oral([.tablets, .liquids, .syrups]),
            .topical([.creams, .ointments, .gels]),
            .intravenous([.intravenousSolutions]),
            .intramuscular([.intramuscularInjections]),
            .subcutaneous([.subcutaneousInjections]),
            .inhaled([.inhalers]),
            .rectal([.suppositories, .enemas]),
            .intradermal([.intradermalInjections])
        ]
    }
    
    var title: String {
        switch self {
        case .oral:
            return "Oral"
        case .topical:
            return "Topico"
        case .intravenous:
            return "Intravenoso"
        case .intramuscular:
            return "Intramuscular"
        case .subcutaneous:
            return "Subcutaneo"
        case .inhaled:
            return "Inalable"
        case .rectal:
            return "Rectal"
        case .intradermal:
            return "Intradermis"
        }
    }
    
    var rawValue: String {
        switch self {
        case .oral:
            return "oral"
        case .topical:
            return "topical"
        case .intravenous:
            return "intravenous"
        case .intramuscular:
            return "intramuscular"
        case .subcutaneous:
            return "subcutaneous"
        case .inhaled:
            return "inhaled"
        case .rectal:
            return "rectal"
        case .intradermal:
            return "intradermal"
        }
    }
    
    var subDoses: [MedicationDoseFormSubtype] {
        switch self {
        case let .oral(array):
            return array
        case let .topical(array):
            return array
        case let .intravenous(array):
            return array
        case let .intramuscular(array):
            return array
        case let .subcutaneous(array):
            return array
        case let .inhaled(array):
            return array
        case let .rectal(array):
            return array
        case let .intradermal(array):
            return array
        }
    }
}
