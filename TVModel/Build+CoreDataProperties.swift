//
//  Build+CoreDataProperties.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
//

import Foundation
import CoreData

class Build: NSManagedObject {

    @NSManaged var number: String
    @NSManaged var message: String?
    @NSManaged var branch: String
    @NSManaged var status: Int
    @NSManaged var repo: Repo?

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
    }
    
    init(number:String, message: String, branch: String, status: Int, context: NSManagedObjectContext){
        
        let entity =  NSEntityDescription.entityForName("Build", inManagedObjectContext: context)!
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        
        self.number = number
        self.message = message
        self.branch = branch
        self.status = status
    }
}

extension Build {
    func toEntity() -> BuildEntity{
        return BuildEntity(number: number, message: message!, branch: branch, status: BuildEntity.StatusCode(rawValue: status)!)
    }
}
