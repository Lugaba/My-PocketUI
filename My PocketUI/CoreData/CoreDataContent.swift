//
//  CoreDataContent.swift
//  My PocketUI
//
//  Created by Luca Hummel on 22/07/21.
//

import CoreData

class CoreDataStackContent {
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
    
    static func createContent(nome: String, textColor: String) throws -> Content{
        guard let content = NSEntityDescription.insertNewObject(forEntityName: "Content", into: context) as? Content else {preconditionFailure()}
        content.nome = nome
        content.textColor = textColor
        try saveContext()
        return content
    }
    
    static func getContents() throws -> [Content] {
        return try context.fetch(Content.fetchRequest())
    }
    
    static func deleteContent(content: Content) throws{
        context.delete(content)
        try saveContext()
    }
}

