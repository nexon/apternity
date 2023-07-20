//
//  ATYMainScreenView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct ATYMainScreenView: View {
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            NavigationStack {
                MedicationTabView()
            }
            .tabItem {
                Label("Medications", systemImage: "pill")
            }
            
            ATYReminderTabView()
                .tabItem {
                    Label("Reminders", systemImage: "bell")
                }
            ATYRegistryTabView()
                .tabItem {
                    Label("Registry", systemImage: "list.bullet.clipboard")
                }
        }
    }
}

struct ATYMainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ATYMainScreenView()
    }
}
