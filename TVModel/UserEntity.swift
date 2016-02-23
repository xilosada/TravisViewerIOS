//
//  UserEntity.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 12/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation

public struct UserEntity {
    public let name: String
    public let avatarUrl:String
    
    public var repos = [RepositoryEntity]()

    init (name: String, avatarUrl: String) {
        self.name = name
        self.avatarUrl = avatarUrl
    }
}

extension UserEntity{
    public init?(dictionary: [String : AnyObject?]) {
        guard let name = dictionary["login"] as? String,
            avatarUrl = dictionary["avatar_url"] as? String else{
                return nil
        }
        self.name = name
        self.avatarUrl = avatarUrl
    }
}