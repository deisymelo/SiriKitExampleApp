//
//  SiriKitExampleApp.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 18/10/23.
//

import SwiftUI

@main
struct SiriKitExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
