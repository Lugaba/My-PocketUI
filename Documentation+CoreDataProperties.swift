//
//  Documentation+CoreDataProperties.swift
//  My PocketUI
//
//  Created by Luca Hummel on 22/07/21.
//
//

import Foundation
import CoreData


extension Documentation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Documentation> {
        return NSFetchRequest<Documentation>(entityName: "Documentation")
    }

    @NSManaged public var title: String?
    @NSManaged public var information: String?
    @NSManaged public var isEditable: Bool
    @NSManaged public var myContent: String?

}

extension Documentation : Identifiable {

}
