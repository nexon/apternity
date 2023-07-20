//
//  MedicationTabView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct MedicationTabView: View {
    
    @State private var newMedication = false
    @ObservedObject var listViewModel = MedicationListViewModel()
    
    var body: some View {
        MedicationListView(viewModel: listViewModel)
            .navigationTitle("Medication List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        newMedication = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $newMedication) {
                NavigationView {
                    AddMedicationView()
                }
                .interactiveDismissDisabled()
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationTabView()
    }
}
