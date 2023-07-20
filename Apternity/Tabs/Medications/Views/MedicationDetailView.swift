//
//  MedicationDetailView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct MedicationDetailView: View {
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, yyyy"
        
        return formatter
    }
    
    let entity: MedicationEntity
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Active Course")
                    .foregroundStyle(.gray)
                    .fontWeight(.light)
                Text(entity.medicationName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding([.top, .bottom], 10)
                Text("Euthyrox is a replacement for a hormone normally produced by your thyroid gland to regulate the body's energy and metabolism. Levothyroxine is given when the thyroid does not produce enough of this hormone on its own.")
                    .fontWeight(.ultraLight)
                Text("Schedule")
                    .fontWeight(.semibold)
                    .padding([.top, .bottom], 10)
                HStack {
                    Button {
                        print("Add schedule")
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                    )
                    Text("7:00")
                        .fontWeight(.light)
                        .padding(7)
                        //.padding([.leading, .trailing], 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.1))
                        )
                }
                .padding([.bottom], 10)
                
                MedicationCardView(name: entity.medicationName,
                                   startDate: entity.durationStart,
                                   endDate: entity.durationEnd,
                                   instructions: entity.instructions,
                                   frequency: entity.frequency.title)
                
                // PROGRESS
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Progress")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Course started: \(Self.dateFormatter.string(from: entity.durationStart))")
                                .font(.footnote)
                                .foregroundColor(.gray.opacity(0.5))
                        }
                        Spacer()
                    }
                    .padding([.leading, .top, .bottom], 20)
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Gauge(value: Date().timeIntervalSince1970,
                              in: entity.durationStart.timeIntervalSince1970...entity.durationEnd.timeIntervalSince1970) {
                                    Image(systemName: "gauge.medium")
                                        .font(.system(size: 50.0))
                                } currentValueLabel: {
                                    Text("\(percentageCompleted(startDate: entity.durationStart, endDate: entity.durationEnd))")
                                }
                                .gaugeStyle(MedicationGaugeStyle())
                                
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray.opacity(0.15))
                )
                .padding(.top, 20)
            }
            .padding(15)

        }
    }
    
    private func percentageCompleted(startDate: Date, endDate: Date) -> Int {
        let totalDuration = endDate.timeIntervalSince(startDate)
        let elapsedDuration = Date().timeIntervalSince(startDate)
        let percentage = (elapsedDuration / totalDuration) * 100
        
        return Int(percentage)
    }
    
    
}
