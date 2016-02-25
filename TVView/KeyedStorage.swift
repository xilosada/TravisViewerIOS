//
//  KeyedStorage.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 23/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation

///Helper class to store Strings in a NSKeyedArchiver
class KeyedStorage {
    
    static private var lastSearchFile: String {
        let manager = NSFileManager.defaultManager()
        let url = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first! as NSURL
        return url.URLByAppendingPathComponent("last_search").path!
    }
    
    static func saveString(value:String) {
        NSKeyedArchiver.archiveRootObject(value, toFile: lastSearchFile)
    }
    
    static func loadString() -> String? {
        var value: String?
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(lastSearchFile) as? String {
            value = array
        }
        return value
    }
    
    
}