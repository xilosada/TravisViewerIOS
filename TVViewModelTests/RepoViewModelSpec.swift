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
    
    // MARK: - Spec
    override func spec() {
        var viewModel: RepoTableViewModel!
        beforeEach {
            viewModel =  RepoTableViewModel(network: StubNetwork())
        }
        describe("Constructor"){
            it("Constructor happy case works fine"){
                let builds = try! viewModel.loadRepos("test").toBlocking().first()
                expect(builds).toNot(beNil())
                expect(builds!.count).to(beGreaterThan(0))
            }
        }
    }
}