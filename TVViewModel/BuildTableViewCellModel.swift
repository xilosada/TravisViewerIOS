//
//  BuildTableViewCellModel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 10/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import TVModel

public final class BuildTableViewCellModel: BuildTableViewCellModeling {

    public let number: String
    public let branchText: String
    public let statusText: String
    
    internal init(build: BuildEntity) {
        number = build.number
        branchText = "\(build.branch)"
        switch build.status {
        case .Errored:
            statusText = "Errored 😱"
        case .Failed:
            statusText = "Failed 😰"
        case .Passed:
            statusText = "Passed 😏"
        }
    }
}