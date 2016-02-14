//
//  User+DBmodel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

extension UserEntity {
    
    func parseToDBO() -> User {
        let user = User(name: name, avatarUrl: avatarUrl, context: CoreDataStackManager.instance.managedObjectContext)
        var repoList = [Repo]()
        repos.forEach{ repoList.append( $0.parseToDBO() )}
        user.repos = NSSet(array: repoList)
        return user
    }
}