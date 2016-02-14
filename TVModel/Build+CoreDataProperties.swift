//
//  Build+CoreDataProperties.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

class Build: NSManagedObject {

    @NSManaged var number: String
    @NSManaged var message: String?
    @NSManaged var branch: String
    @NSManaged var repo: Repo?

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
    }
    
    init(number:String, message: String, branch: String, context: NSManagedObjectContext){
        
        let entity =  NSEntityDescription.entityForName("Build", inManagedObjectContext: context)!
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        
        self.number = number
        self.message = message
        self.branch = branch
    }
}
