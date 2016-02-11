//
//  BuildTableViewModelSpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 10/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking

@testable import TVModel
@testable import TVViewModel

class BuildTableViewModelSpec: QuickSpec {
    
    // MARK: - Spec
    override func spec() {
        var viewModel: BuildTableViewModel!
        beforeEach {
            viewModel =  BuildTableViewModel(network: StubNetwork())
        }
        describe("Constructor"){
            it("Constructor happy case works fine"){
                let builds = try! viewModel.loadBuilds("test").toBlocking().first()
                expect(builds).toNot(beNil())
                expect(builds!.count).to(beGreaterThan(0))
            }
        }
    }
    
    // MARK: Stub
    class StubNetwork: Networking {
        
        init(){}
        
        func requestBuilds(repoName: String) -> Observable<[BuildEntity]>{
            var buildDict = ["number":"3","branch":"development", "message":"m1","result": 1]
            let buildEntity1 = BuildEntity(dictionary: buildDict)!
            buildDict = ["number":"2","branch":"development", "message":"m2","result": 0]
            
            let buildEntity2 = BuildEntity(dictionary: buildDict)!
            buildDict = ["number":"1","branch":"development", "message":"m1","result": 2]
            let buildEntity3 = BuildEntity(dictionary: buildDict)!
            return Observable.just([buildEntity1, buildEntity2, buildEntity3])
        }
        
        func requestRepositories(username: String) -> Observable<[RepositoryEntity]>{
            return Observable.empty()
        }
    }
}