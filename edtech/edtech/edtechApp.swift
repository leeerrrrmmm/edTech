//
//  edtechApp.swift
//  edtech
//
//  Created by .Leeerrrmmm . on 25.04.2025.
//

import SwiftUI

@main
struct edtechApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
