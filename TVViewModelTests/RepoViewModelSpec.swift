//
//  RepoViewModelSpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking

@testable import TVModel
@testable import TVViewModel

class RepoTableViewModelSpec: QuickSpec {
    
    private class StubStorage: Storaging {
        func getUser(username:String) -> Observable<UserEntity>{return Observable.empty()}
    
        func getRepos(username:String) -> Observable<[RepositoryEntity]>{
            let fakeRepo = RepositoryEntity(id: 1, slug: "w", description: "w")
            return Observable.just([fakeRepo])
        }
    
        func getBuilds(repoId:Int) -> Observable<[BuildEntity]>{return Observable.empty()}
    }
    
    // MARK: - Spec
    override func spec() {
        var viewModel: RepoTableViewModel!
        beforeEach {
            viewModel =  RepoTableViewModel(storage: StubStorage())
        }
        describe("Constructor"){
            it("Constructor happy case works fine"){
                let builds = try! viewModel.getRepos("1").toBlocking().first()
                expect(builds).toNot(beNil())
                expect(builds!.count).to(beGreaterThan(0))
            }
        }
    }
}