//
//  BuildEntity.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 04/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

public struct BuildEntity{
    ///Starts from 1 and increments in each build on travis
    public let number: String
    public let message: String
    public let branch: String
    public let status: StatusCode
        
    init(number: String, message: String, branch: String, status: StatusCode){
        self.number = number
        self.message = message
        self.branch = branch
        self.status = status
    }
}

extension BuildEntity {

    public enum StatusCode: Int {
        case Passed, Failed, Errored
    }
    
}

extension BuildEntity {
    init?(dictionary: [String : AnyObject?]) {
        guard let number: String = dictionary["number"] as? String,
            let message: String = dictionary["message"] as? String,
            let branch: String = dictionary["branch"] as? String
            else{
                return nil
        }
        
        if let statusInteger: Int = dictionary["result"] as? Int {
            self.status = StatusCode(rawValue: statusInteger)!
        }
        else {
            self.status = .Errored
        }
        
        self.number = number
        self.message = message
        self.branch = branch
    }
    
    struct Mapper{
        static func parseJSONArray(jsonArray: [AnyObject]) throws -> [BuildEntity] {
            var builds = [BuildEntity]()
            try jsonArray.forEach { jsonObject in
                if let buildDictionary = jsonObject as? NSDictionary {
                    builds.append(BuildEntity(dictionary: buildDictionary as! [String:AnyObject])!)
                } else {
                    throw NSError(domain: "build mapper", code: 0, userInfo: nil)
                }
            }
            return builds
        }
    }
}