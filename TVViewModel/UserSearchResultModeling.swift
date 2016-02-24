//
//  UserSearchResultModeling.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 12/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

public protocol UserSearchResultModeling {
    var username: String { get }
    var avatarUrl: String? { get }
    var result: Bool { get }
    var numberOfRepos: Int { get }
}