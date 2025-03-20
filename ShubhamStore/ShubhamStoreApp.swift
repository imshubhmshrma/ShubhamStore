//
//  ShubhamStoreApp.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 17/02/25.
//

import SwiftUI
import SwiftData

@main
struct ShubhamStoreApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LandingPageView()
                .environment(\.managedObjectContext, persistenceController.persistantContainer.viewContext)
        }
     //   .modelContainer(sharedModelContainer)
    }
}
