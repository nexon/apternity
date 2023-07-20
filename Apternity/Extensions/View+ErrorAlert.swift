//
//  View+ErrorAlert.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI
import Foundation

extension View {
    func alt_alert<E: LocalizedError>(error: Binding<E?>) -> some View {
        alt_alert(error: error) { _ in
            Button("Ok") {
                error.wrappedValue = nil
            }
        }
    }

    func alt_alert<E: LocalizedError, A: View>(error: Binding<E?>, @ViewBuilder actions: (E) -> A) -> some View {
        alert(
            isPresented: .constant(error.wrappedValue != nil),
            error: error.wrappedValue,
            actions: actions
        ) {
            Text($0.failureReason.unwrapped)
        }
    }
    
}
