//
//  IntentHandler.swift
//  SiriKitExampleIntent
//
//  Created by Deisy Melo on 2/02/24.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        return ShoppingListHandler()
    }
}
