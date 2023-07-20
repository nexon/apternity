//
//  MedicationListView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct MedicationListView: View {
    
    @ObservedObject var viewModel: MedicationListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.medications) { medication in
                NavigationLink {
                    MedicationDetailView(entity: medication)
                } label: {
                    MedicationListRowView(entity: medication)
                        .padding(10)
                }
                .listRowSeparator(.hidden)

            }
            .onDelete(perform: viewModel.onDelete)
        }
        .listStyle(.plain)
        .alt_alert(error: $viewModel.viewError) { error in
            if error.errorType == .load {
                Button("Ok") {
                    viewModel.viewError = nil
                }
            }
        }
        .emptyState(viewModel.isEmpty) {
            VStack {
                Image(systemName: "pill")
                    .foregroundStyle(.teal, .gray)
                    .font(.system(size: 46.0))
                    .padding(.bottom, 10)
                    
                Text("No Medications")
            }
            .font(.title3)
            .foregroundColor(Color.secondary)
        }
        .onAppear {
            viewModel.onLoad()
        }
    }
}
