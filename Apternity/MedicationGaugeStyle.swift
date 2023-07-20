//
//  MedicationGaugeStyle.swift
//  apternity
//
//  Created by Alberto Lagos on 17-07-23.
//

import Foundation
import SwiftUI

struct MedicationGaugeStyle: GaugeStyle {

    private var gradient = LinearGradient(gradient: Gradient(colors: [Color(red: 98/255, green: 217/255, blue: 98/255), Color(red: 35/255, green: 167/255, blue: 65/255)]), startPoint: .trailing, endPoint: .leading)
 
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
 
            Circle()
                .foregroundColor(Color(.systemGray6))
 
            Circle()
                .trim(from: 0, to: 0.75 * configuration.value)
                .stroke(gradient, lineWidth: 20)
                .rotationEffect(.degrees(135))
 
            HStack {
                configuration.currentValueLabel
                    .font(.system(size: 50, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
                Text("%")
                    .font(.system(size: 50, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
            }
 
        }
        .frame(width: 200, height: 200)
    }
 
}
