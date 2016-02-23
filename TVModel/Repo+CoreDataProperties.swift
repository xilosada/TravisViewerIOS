//
//  Repo+CoreDataProperties.swift
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

class Repo: NSManagedObject {
    
    @NSManaged var id: NSNumber?
    @NSManaged var slug: String?
    @NSManaged var descr: String?
    
    @NSManaged var builds : NSOrderedSet?
    @NSManaged var user: User?
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?){
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
    }
    
    init(id:Int, slug: String, description: String, context: NSManagedObjectContext){
        let entity =  NSEntityDescription.entityForName("Repo", inManagedObjectContext: context)!
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        self.id = id as NSNumber
        self.slug = slug
        self.descr = description
    }

}

extension Repo {
    func toEntity() -> RepositoryEntity {
        var repo = RepositoryEntity(
            id: id!.integerValue,
            slug: slug!,
            description: descr!)
        
        var buildsAux = [BuildEntity]()
        builds?.forEach{ anyBuild in
            let dbBuild = anyBuild as! Build
            buildsAux.append(dbBuild.toEntity())
        }
        repo.builds = buildsAux
        return repo
    }
}
