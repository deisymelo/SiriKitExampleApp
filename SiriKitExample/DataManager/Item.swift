//
//  Item.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 18/10/23.
//

import Foundation

struct Item: Identifiable {
    var id = UUID().uuidString
    let title: String
}
