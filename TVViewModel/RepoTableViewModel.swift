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
    
    private let network: Networking
    
    public init(network: Networking) {
        self.network = network
    }
    
    public func loadRepos(username: String) -> Observable<[RepoTableViewCellModeling]> {
        return network.requestRepositories(username).map{
            $0.flatMap{ RepoTableViewCellModel(repo: $0) as RepoTableViewCellModeling}
        }
    }
}