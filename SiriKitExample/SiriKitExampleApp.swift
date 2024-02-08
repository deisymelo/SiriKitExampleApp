//
//  SiriKitExampleApp.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 18/10/23.
//

import SwiftUI
import Intents

@main
struct SiriKitExampleApp: App {
    
    init() {
        donateIntent()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func donateIntent() {
        let intent = ShoppingListIntent()
        intent.suggestedInvocationPhrase = "Add new item to shopping list"
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
}
