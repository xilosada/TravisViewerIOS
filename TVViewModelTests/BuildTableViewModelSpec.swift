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
}