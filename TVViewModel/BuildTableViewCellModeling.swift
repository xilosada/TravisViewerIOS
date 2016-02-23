
//
//  BuildTableViewCellModeling.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

public protocol BuildTableViewCellModeling {
    var number: String { get }
    var branchText: String { get }
    var statusText: String { get }
    var result: Bool { get }
}