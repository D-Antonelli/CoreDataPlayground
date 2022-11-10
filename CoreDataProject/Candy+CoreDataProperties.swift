//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Derya Antonelli on 10/11/2022.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var unwrappedName: String {
        return name ?? "unknown";
    }

}

extension Candy : Identifiable {

}
