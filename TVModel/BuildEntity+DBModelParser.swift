//
//  BuildEntity+DBModelParser.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import CoreData

extension BuildEntity {
    
    func parseToDBO(context: NSManagedObjectContext) -> Build {
        return Build(number: number, message: message, branch: branch, status: status.rawValue ,context: context)
    }
}