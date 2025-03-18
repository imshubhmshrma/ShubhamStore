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
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            LandingPageView(coreDataManager: CoreDataManager())
        }
     //   .modelContainer(sharedModelContainer)
    }
}
