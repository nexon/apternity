//
//  AddMedicationView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct AddMedicationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var showAlert: Bool = false
    @State private(set) var viewError: ViewError<AddMedicationViewModel.ViewErrorType>?
    
    @ObservedObject var viewModel = AddMedicationViewModel(repository: RemoteAddMedicationRepository())
    
    var body: some View {
        List {
            Section("Informacion Básica") {
                TextField("Medication Name", text: $viewModel.medicationName)
            }
            
            Section("Instrucciones") {
                TextField("Instrucciones", text: $viewModel.instructions)
                Picker(selection: $viewModel.frequency, label: Text("Frequency")) {
                    ForEach(MedicationFrequencyEntity.allCases, id:\.self) {
                        Text($0.title)
                    }
                }
                
//                Picker(selection: $viewModel.instruction, label: Text("Dose")) {
//                    ForEach(MedicationDoseForm.allDoses, id:\.self) {
//                        Text($0.title)
//                    }
//                }
//                Picker(selection: $viewModel.subDose, label: Text("SubDose")) {
//                    ForEach(viewModel.dose.subDoses, id:\.self) {
//                        Text($0.title)
//                    }
//                }
                TextField("Additional Notes", text: $viewModel.additionalNotes)
            }
            
            Section("Duración") {
                DatePicker("From", selection: $viewModel.durationStart, displayedComponents: .date)
                DatePicker("Until", selection: $viewModel.durationEnd, displayedComponents: .date)
            }
            
            Section("Recordatorios") {
                Toggle(isOn: $viewModel.reminder) {
                    Text("Remind me")
                }
                Picker(selection: $viewModel.reminderFrequency, label: Text("Frequency")) {
                    ForEach(MedicationFrequencyEntity.allCases, id:\.self) {
                        Text($0.title)
                    }
                }
            }
            
            Section("Notas Adicionales") {
                TextField("Additional Notes", text: $viewModel.additionalNotes)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    showAlert = true
                }) {
                    Text("Close")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.onSave()
                    dismiss()
                } label: {
                    Text("Save")
                }

            }
        }
        .alt_alert(error: $viewError) { error in
            if error.errorType == .save {
                Button("Ok") {
                    viewError = nil
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("¿Estás seguro?"),
                message: Text("¿Quieres descartar los cambios?"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Descartar")) {
                    dismiss()
                }
            )
        }
        .navigationTitle("New Medication")
    }
}
