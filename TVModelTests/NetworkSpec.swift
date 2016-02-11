//
//  NetworkSpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking

@testable import TVModel

class NetworkSpec: QuickSpec {
    
    // MARK: - Spec
    override func spec() {
        var network: Networking!

        beforeEach {
            network = Network(URLSession: NSURLSession.sharedSession())
        }

        describe("Network calls to travis CI API"){
            /**/
            it("Gets repos user's repos"){
                let repos = try! network.requestRepositories("xilosada").toBlocking().first()
                expect(repos).toNot(beNil())
                expect(repos!.count).to(beGreaterThan(0))
            }
            
            /**/
            it("Gets repos's builds"){
                let builds = try! network.requestBuilds("xilosada/BitcoinFinder").toBlocking().first()
                expect(builds).toNot(beNil())
                expect(builds!.count).to(beGreaterThan(0))
            }
        }
        
    }
}