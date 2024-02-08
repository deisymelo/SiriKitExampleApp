//
//  DataManager.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 18/10/23.
//

import Combine
import CoreData

protocol CoreDataManagerProtocol {
    func saveItem(_ item: Item)
    func getItems() -> [Item]
    func deleteItem(_ itemToDelete: Item)
}

public final class CoreDataManager: CoreDataManagerProtocol {
    public lazy var persistenContainer: NSPersistentContainer = {
        let storeURL = URL.storeURL(for: "group.name", databaseName: "SiriKitExample")
        let storeDescription = NSPersistentStoreDescription(url: storeURL)
        let container = NSPersistentContainer(name: "SiriKitExample")
        container.persistentStoreDescriptions = [storeDescription]
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError("persistenContainer: \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        persistenContainer.viewContext
    }

    public init() {}

    private func createItemModel(item: ItemEntity) -> Item {
        let item = Item(title: item.title ?? "")
        return item
    }

    public func saveItem(title: String) {
        let item = Item(title: title)
        saveItem(item)
    }

    func saveItem(_ item: Item) {
        do {
            let entity = ItemEntity(context: context)
            entity.setValue(item.title, forKey: "title")
            try context.save()
        } catch {
            print("saveItem: \(error)")
        }
    }

    func getItems() -> [Item] {
        do {
            let fetchRequest = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
            let list =  try context.fetch(fetchRequest)
            var itemsList: [Item] = []
            list.forEach { item in
                itemsList.append(createItemModel(item: item))
            }

            return itemsList
        } catch {
            print("getItems: \(error)")
            return []
        }
    }
    
    func deleteItem(_ itemToDelete: Item) {
        do {
            let fetchRequest = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
            fetchRequest.predicate = NSPredicate(format: "title = %@", itemToDelete.title)
            let list =  try context.fetch(fetchRequest)

            guard let item = list.first else {
                return
            }
            context.delete(item)
            try context.save()
        } catch {
            print("getItems: \(error)")
        }
    }
}

public enum DataError: Error {
    case notFound
}

public extension URL {
    /// Returns a URL for the given app group and database pointing to the sqlite database.
    static func storeURL(for appGroup: String, databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Shared file container could not be created.")
        }

        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }
}

