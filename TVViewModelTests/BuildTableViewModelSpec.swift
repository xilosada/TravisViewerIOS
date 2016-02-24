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
    
    private class StubStorage: Storaging {
        func getUser(username:String) -> Observable<UserEntity>{return Observable.empty()}
        func getRepos(username:String) -> Observable<[RepositoryEntity]>{return Observable.empty()}
        func getBuilds(repoId:Int) -> Observable<[BuildEntity]>{
            let fakeBuild = BuildEntity(number: "1", message: "w", branch: "w", status: .Failed)
            return Observable.just([fakeBuild])
        }
    }
    
    // MARK: - Spec
    override func spec() {
        var viewModel: BuildTableViewModel!
        beforeEach {
            viewModel =  BuildTableViewModel(storage: StubStorage())
        }
        describe("Constructor"){
            it("Constructor happy case works fine"){
                let builds = try! viewModel.getBuilds(1).toBlocking().first()
                expect(builds).toNot(beNil())
                expect(builds!.count).to(equal(1))
            }
        }
    }
}