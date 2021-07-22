//
//  Content+CoreDataProperties.swift
//  My PocketUI
//
//  Created by Luca Hummel on 22/07/21.
//
//

import Foundation
import CoreData


extension Content {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Content> {
        return NSFetchRequest<Content>(entityName: "Content")
    }

    @NSManaged public var nome: String?

}

extension Content : Identifiable {

}
