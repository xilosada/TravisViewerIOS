//
//  TVModelTests.swift
//  TVModelTests
//
//  Created by X.I. Losada on 04/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Quick
import Nimble

@testable import TVModel

class BuildEntitySpec: QuickSpec {
    
    // MARK: - Spec
    override func spec() {
        describe("Constructor"){
            it("Constructor happy case works fine"){
                let build = BuildEntity(number: "1",message: "a message", branch: "DBranch", status: .Passed)
                expect(build.number).to(equal("1"))
                expect(build.message).to(equal("a message"))
                expect(build.branch).to(equal("DBranch"))
                expect(build.status).to(equal(BuildEntity.StatusCode.Passed))
            }
        }
        
        describe("JSON decoding"){
            let builds = try! BuildEntity.Mapper.parseJSONArray(Dummy.dummyBuildsJSON)
            it("decodes an array of builds as expected"){
                expect(builds.count).to(equal(15))
                expect(builds[0].number).to(equal("15"))
                expect(builds[0].status).to(equal(BuildEntity.StatusCode.Passed))
                expect(builds[0].branch).to(equal("master"))
                
                expect(builds[1].status).to(equal(BuildEntity.StatusCode.Errored))
                
                expect(builds[14].number).to(equal("1"))
            }
            
        }

    }
}
