//
//  MedicationDoseFormSubtype.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import Foundation

enum MedicationDoseFormSubtype: String, Hashable {
    case tablets
    case capsules
    case liquids
    case syrups
    case chewableTablets
    case creams
    case ointments
    case gels
    case lotions
    case transdermalPatches
    case intravenousSolutions
    case intramuscularInjections
    case subcutaneousInjections
    case inhalers
    case suppositories
    case enemas
    case intradermalInjections
    
    var imageName: String {
        switch self {
        case .tablets:
            return "pills"
        case .capsules:
            return "pills"
        case .liquids:
            return "drop"
        case .syrups:
            return "drop.triangle.fill"
        case .chewableTablets:
            return "pills"
        case .creams:
            return "pills"
        case .ointments:
            return "pills"
        case .gels:
            return "pills"
        case .lotions:
            return "pills"
        case .transdermalPatches:
            return "pills"
        case .intravenousSolutions:
            return "pills"
        case .intramuscularInjections:
            return "pills"
        case .subcutaneousInjections:
            return "pills"
        case .inhalers:
            return "pills"
        case .suppositories:
            return "pills"
        case .enemas:
            return "pills"
        case .intradermalInjections:
            return "pills"
        }
    }
    
    var title: String {
        switch self {
        case .tablets:
            return "Tablets"
        case .capsules:
            return "Capsules"
        case .liquids:
            return "Liquids"
        case .syrups:
            return "Syrups"
        case .chewableTablets:
            return "Chewable Tablets"
        case .creams:
            return "Creams"
        case .ointments:
            return "Ointments"
        case .gels:
            return "Gels"
        case .lotions:
            return "Lotions"
        case .transdermalPatches:
            return "Transdermal Patches"
        case .intravenousSolutions:
            return "Intravenous Solutions"
        case .intramuscularInjections:
            return "Intramuscular Injections"
        case .subcutaneousInjections:
            return "Subcutaneous Injections"
        case .inhalers:
            return "Inhalers"
        case .suppositories:
            return "Suppositories"
        case .enemas:
            return "Enemas"
        case .intradermalInjections:
            return "Intradermal Injections"
        }
    }
}
