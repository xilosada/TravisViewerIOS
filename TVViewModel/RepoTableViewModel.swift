//
//  RepoTableViewModel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import TVModel
import RxSwift

public final class RepoTableViewModel: RepoTableViewModeling {
    
    private let storage: Storaging!
    
    public init(storage: Storaging) {
        self.storage = storage
    }
    
    public func getRepos(username: String) -> Observable<[RepoTableViewCellModeling]> {
        return storage.getRepos(username).map{
            $0.flatMap{ RepoTableViewCellModel(repo: $0) as RepoTableViewCellModeling }
        }
    }
}