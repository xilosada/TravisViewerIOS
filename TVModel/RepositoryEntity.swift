//
//  RepositoryEntity.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 04/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation

public struct RepositoryEntity {
    public let id: Int
    public let slug: String
    public let description: String
    
    public var builds = [BuildEntity]()

    init(id: Int, slug: String, description: String) {
        self.id = id
        self.slug = slug
        self.description = description
    }
}

extension RepositoryEntity {
    init?(dictionary: NSDictionary) {
        guard let id = dictionary["id"] as? Int,
        slug = dictionary["slug"] as? String,
        description = dictionary["description"] as? String
            else{
                return nil
        }
        
        self.id = id
        self.slug = slug
        self.description = description
    }
    
    struct Mapper{
        static func parseJSONArray(jsonArray: [AnyObject]) throws -> [RepositoryEntity] {
            var repos = [RepositoryEntity]()
            try jsonArray.forEach { jsonObject in
                if let repoDictionary = jsonObject as? NSDictionary {
                    if let repo = RepositoryEntity(dictionary: repoDictionary){
                        repos.append(repo)
                    }
                } else {
                    throw NSError(domain: "repo mapper", code: 0, userInfo: nil)
                }
            }
            return repos
        }
    }
}