//
//  CoreDataManager.swift
//  EvantsApp
//
//  Created by Андрей on 09.03.2023.
//

import CoreData
import UIKit.UIImage

final class CoreDataManager {
    
    // MARK: - Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EvantsApp")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        return persistentContainer
    }()
    
    // MARK: - Managet Object Context
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveEvent(
        name: String,
        date: Date,
        image: UIImage
    ) {
        let event = Event(context: managedObjectContext)
        event.setValue(name, forKey: "name")
        event.setValue(date, forKey: "date")
        
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        
        do {
            try managedObjectContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try managedObjectContext.fetch(fetchRequest)
            return events
        }
        catch {
            print(error.localizedDescription)
            return []
        }
        
    }
}
