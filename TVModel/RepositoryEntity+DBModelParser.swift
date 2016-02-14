//
//  Repo+DB.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import Foundation

extension RepositoryEntity {
    
    func parseToDBO() -> Repo {
        let repo = Repo(id: id, slug: slug, description: description, context:CoreDataStackManager.instance.managedObjectContext)
        var buildList = [Build]()
        builds.forEach{ buildList.append( $0.parseToDBO() )}
        repo.builds = NSSet(array:  buildList)
        return repo
    }

}