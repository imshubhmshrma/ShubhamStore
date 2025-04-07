//
//  ShubhamStoreApp.swift
//  ShubhamStore
//
//  Created by Shubham Sharma on 17/02/25.
//

import SwiftUI
import SwiftData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct ShubhamStoreApp: App {
    
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            LandingPageView()
                .environment(\.managedObjectContext, persistenceController.persistantContainer.viewContext)
        }
     //   .modelContainer(sharedModelContainer)
    }
}
