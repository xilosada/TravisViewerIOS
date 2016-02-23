//
//  User+DBmodel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import CoreData

extension UserEntity {
    
    func parseToDBO(context: NSManagedObjectContext) -> User {
        let user = User(name: name, avatarUrl: avatarUrl, context: context)
        
        let dbRepos = NSOrderedSet(array: repos.map{ $0.parseToDBO(context) })
        user.repos = dbRepos
        
        return user
    }
}