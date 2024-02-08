//
//  ModelData.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 19/10/23.
//

import Foundation

class ModelData: ObservableObject {
    
    @Published var list: [Item] = []
    
    private let dataManager: CoreDataManagerProtocol = CoreDataManager()
    
    func fetchItemsList() {
        list = dataManager.getItems()
    }
    
    func saveItem(_ title: String) {
        let item = Item(title: title)
        dataManager.saveItem(item)
        fetchItemsList()
    }
    
    func deleteItems(offsets: IndexSet) {
        guard let item = offsets.map({ list[$0] }).first else {
            return
        }
        dataManager.deleteItem(item)
    }
}
