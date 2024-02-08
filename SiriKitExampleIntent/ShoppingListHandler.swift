//
//  ShoppingListHandler.swift
//  SiriKitExampleIntent
//
//  Created by Deisy Melo on 6/02/24.
//

import Foundation
import Intents

class ShoppingListHandler: NSObject, ShoppingListIntentHandling {
    
    /// Determine if this intent is ready for the next step (confirmation)
    /// We have to called this to make sure the app extension is capable of handling this intent in its current form.
    /// This method is for validating if the intent needs any further fleshing out.
    func resolveNewItem(for intent: ShoppingListIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let newItem = intent.newItem, !newItem.isEmpty {
            completion(.success(with: newItem))
        } else {
            completion(.needsValue())
        }
    }
    
    
    /// Handling method - Execute the task represented by the ShoppingListIntent that's passed in
    /// Called to actually execute the intent.
    /// The app must return a response for this intent.
    func handle(intent: ShoppingListIntent, completion: @escaping (ShoppingListIntentResponse) -> Void) {
        guard let newItem = intent.newItem else {
            completion(ShoppingListIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        CoreDataManager().saveItem(title: newItem)
        completion(ShoppingListIntentResponse.success(newItem: newItem))
    }
    
}
