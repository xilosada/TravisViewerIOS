//
//  RepoTableViewCellModeling.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

public protocol RepoTableViewCellModeling {
    var id: Int { get }
    var slug: String { get }
    var description: String { get }
    var numberOfBuilds: Int { get }
}