//
//  RepoTableViewCellModel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import TVModel

public class RepoTableViewCellModel: RepoTableViewCellModeling {
    public let id: Int
    public let slug: String
    public let description: String
    public let numberOfBuilds: Int

    
    internal init(repo: RepositoryEntity) {
        id = repo.id
        slug = repo.slug
        description = repo.description
        numberOfBuilds = repo.builds.count
    }
}