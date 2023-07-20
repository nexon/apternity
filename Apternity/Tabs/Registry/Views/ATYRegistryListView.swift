//
//  ATYRegistryListView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct ATYRegistryListView: View {
    
    @ObservedObject var viewModel: ATYRegistryListViewModel = ATYRegistryListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.registries) { reminder in
                Text("SOME MEDDS!! :D")
            }
        }
        .emptyState(viewModel.isEmpty) {
            VStack {
                Image(systemName: "list.bullet.clipboard")
                    .foregroundStyle(.teal, .gray)
                    .font(.system(size: 46.0))
                    .padding(.bottom, 10)
                    
                Text("No Registries")
            }
            .font(.title3)
            .foregroundColor(Color.secondary)
        }
    }
}

struct ATYRegistryListView_Previews: PreviewProvider {
    static var previews: some View {
        ATYRegistryListView()
    }
}
