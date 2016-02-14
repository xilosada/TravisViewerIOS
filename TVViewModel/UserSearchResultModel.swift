//
//  UserSearchResultModel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 12/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import TVModel

public class UserSearchResultModel: UserSearchResultModeling {
    
    public let username: String
    public let avatarUrl: String?
    public let result: Bool
    
    internal init(user: UserEntity?){
        if let user = user {
            username = user.name
            avatarUrl = user.avatarUrl
            result = true
            return
        }
        username = ""
        avatarUrl = ""
        result = false
        
    }
}