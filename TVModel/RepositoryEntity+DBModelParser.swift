//
//  Repo+DB.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import CoreData

extension RepositoryEntity {
    
    func parseToDBO(context: NSManagedObjectContext)-> Repo {
        let dbRepo = Repo(id: id, slug: slug, description: description, context: context)
        let dbBuilds = NSOrderedSet(array: builds.map{ $0.parseToDBO(context) })
        dbRepo.builds = dbBuilds
        return dbRepo
    }

}