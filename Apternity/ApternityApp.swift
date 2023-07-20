//
//  ApternityApp.swift
//  Apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

@main
struct ApternityApp: App {
    let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            ATYMainScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
