//
//  CoreDataDocumentation.swift
//  My PocketUI
//
//  Created by Luca Hummel on 22/07/21.
//

import CoreData

class CoreDataStackDocumentation {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let erro = error{
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
    
    static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    static func saveContext() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createDocumentation(title: String, information: String, isEditable: Bool, myContent: String) throws -> Documentation{
        guard let documentation = NSEntityDescription.insertNewObject(forEntityName: "Documentation", into: context) as? Documentation else {preconditionFailure()}
        documentation.title = title
        documentation.information = information
        documentation.isEditable = isEditable
        documentation.myContent = myContent
        try saveContext()
        return documentation
    }
    
    static func getDocumentations() throws -> [Documentation] {
        return try context.fetch(Documentation.fetchRequest())
    }
    
    static func deleteDocumentation(documentation: Documentation) throws{
        context.delete(documentation)
        try saveContext()
    }
}
