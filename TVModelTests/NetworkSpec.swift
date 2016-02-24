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
import RxTests
import RxBlocking

@testable import TVModel

import XCTest

class RepoTableViewControllerSpec: XCTestCase {
    
    private var network : Networking!
    
    override func setUp() {
        super.setUp()
        //network = Network(URLSession: NSURLSession.sharedSession())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRequestRepositores() {}
        /*let resolution: NSTimeInterval = 10 // seconds

        let scheduler = TestScheduler(initialClock: 0, resolution: resolution, simulateProcessingDelay: false)
        
        /**
        This is important because driver will try to ensure that elements are being pumped on main scheduler,
        and that sometimes means that it will get queued using `dispatch_async` to main dispatch queue and
        not get flushed until end of the test.
        
        This method enables using mock schedulers for while testing drivers.
        */
        let repos = try! self.network.requestRepositories("xilosada").driveOnScheduler(scheduler) {
            // run experiment
            let recordedSignupEnabled = scheduler.record(viewModel.signupEnabled)
            let recordedValidatedUsername = scheduler.record(viewModel.validatedUsername)
            
            scheduler.start()
            
            // validate
            XCTAssertEqual(recordedValidatedUsername.events, expectedValidatedUsernameEvents)
            XCTAssertEqual(recordedSignupEnabled.events, expectedSignupEnabledEvents)
        }
    }
        
        
        
        
        
        self.measureBlock {
            let repos = try! self.network.requestRepositories("xilosada")
                .toBlocking().first()
            XCTAssert(repos!.count>0, "0 repositories found for selected user")
        }
    }

    func testRequestBuilds() {
        self.measureBlock {
            let builds = try! self.network.requestBuilds("xilosada/BitcoinFinder")
                .toBlocking().first()
            XCTAssert(builds!.count>0, "0 builds found at test repository")
        }
    }*/
}