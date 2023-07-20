//
//  ATYReminderListView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct ATYReminderListView: View {
    
    @ObservedObject var viewModel: ATYReminderListViewModel = ATYReminderListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.reminders) { reminder in
                Text("SOME MEDDS!! :D")
            }
        }
        .emptyState(viewModel.isEmpty) {
            VStack {
                Image(systemName: "bell")
                    .foregroundStyle(.teal, .gray)
                    .font(.system(size: 46.0))
                    .padding(.bottom, 10)
                    
                Text("No Reminders")
            }
            .font(.title3)
            .foregroundColor(Color.secondary)
        }
    }
}

struct ATYReminderListView_Previews: PreviewProvider {
    static var previews: some View {
        ATYReminderListView()
    }
}
