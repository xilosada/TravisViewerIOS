//
//  StubNetwork.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import RxSwift
@testable import TVModel

// MARK: Stub
public class StubNetwork: Networking {
    
    init(){}
    
    public func requestBuilds(repoName: String) -> Observable<[BuildEntity]>{

        let buildEntity1 = BuildEntity(number: "3", message: "m1", branch: "feature", status: .Errored)
        let buildEntity2 = BuildEntity(number: "2", message: "m2", branch: "master", status: .Passed)
        let buildEntity3 = BuildEntity(number: "1", message: "m3", branch: "development", status: .Failed)
        
        return Observable.just([buildEntity1, buildEntity2, buildEntity3])
    }
    
    public func requestRepositories(username: String) -> Observable<[RepositoryEntity]>{
        let repoEntity1 = RepositoryEntity(id: 1, slug: "anybody/ererere", description: "testing 1")
        let repoEntity2 = RepositoryEntity(id: 2, slug: "xilosasa/test", description: "testing 2")
        let repoEntity3 = RepositoryEntity(id: 3, slug: "anybody/lowrarar", description: "testing 3")
        
        return Observable.just([repoEntity1, repoEntity2, repoEntity3])
    }
}