//
//  User+CoreDataProperties.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
//

import Foundation
import CoreData

class User: NSManagedObject{

    
    @NSManaged var name: String
    @NSManaged var avatarUrl: String?
    
    @NSManaged var repos : NSOrderedSet?
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(name:String, avatarUrl: String, context: NSManagedObjectContext){
        let entity =  NSEntityDescription.entityForName("User", inManagedObjectContext: context)!
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        self.name = name
        self.avatarUrl = avatarUrl
    }
}

extension User {
    func toEntity() -> UserEntity {
        var user =  UserEntity(name: name, avatarUrl:avatarUrl!)
        var reposAux = [RepositoryEntity]()
        repos?.forEach{ anyObjectNSSet in
            let repo = anyObjectNSSet as! Repo
            reposAux.append(repo.toEntity())
        }
        user.repos = reposAux
        return user
    }
}
