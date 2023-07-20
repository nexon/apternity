//
//  MedicationListRowView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct MedicationListRowView: View {
    
    var entity: MedicationEntity
    
    var body: some View {
        MedicationCardView(name: entity.medicationName,
                           startDate: entity.durationStart,
                           endDate: entity.durationEnd,
                           instructions: entity.instructions,
                           frequency: entity.frequency.title)
    }
}
