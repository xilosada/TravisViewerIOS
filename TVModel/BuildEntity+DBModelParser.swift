//
//  BuildEntity+DBModelParser.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

extension BuildEntity {
    
    func parseToDBO() -> Build {
        return Build(number: number, message: message, branch: branch, context: CoreDataStackManager.instance.managedObjectContext)
    }
}