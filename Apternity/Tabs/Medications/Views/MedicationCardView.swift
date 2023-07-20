//
//  MedicationCardView.swift
//  apternity
//
//  Created by Alberto Lagos on 17-07-23.
//

import SwiftUI

struct MedicationCardView: View {
    
    let name: String
    let startDate: Date
    let endDate: Date
    let instructions: String
    let frequency: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "pills")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(.green.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.bottom, 20)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Duration")
                        .font(.callout)
                        .fontWeight(.thin)
                        .foregroundColor(.gray.opacity(0.9))
                    HStack {
                        Text(timeRemaining(startDate:startDate, endDate:endDate))
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Instructions")
                        .font(.callout)
                        .fontWeight(.thin)
                        .foregroundColor(.gray.opacity(0.9))
                    HStack {
                        Text(instructions)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Frequency")
                        .font(.callout)
                        .fontWeight(.thin)
                        .foregroundColor(.gray.opacity(0.9))
                    HStack {
                        Text(frequency)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
            }
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.1))
        )
    }
    
    private func timeRemaining(startDate: Date, endDate: Date) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        
        let remainingComponents = Calendar.current.dateComponents([.day, .hour, .minute], from: startDate, to: endDate)
        
        if let timeRemaining = formatter.string(from: remainingComponents) {
            return "\(timeRemaining)"
        } else {
            return "Finalizado"
        }
    }
}
