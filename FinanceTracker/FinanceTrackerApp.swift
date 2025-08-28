//
//  FinanceTrackerApp.swift
//  FinanceTracker
//
//  Created by Gideon Rotich on 28/08/2025.
//

import SwiftUI

@main
struct FinanceTrackerApp: App {
    @StateObject private var appStateViewModel = AppStateViewModel()
    let persistenceController = CoreDataStack.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appStateViewModel)
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}
