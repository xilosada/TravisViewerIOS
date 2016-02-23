//
//  UserEntitySpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 12/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Quick
import Nimble
@testable import TVModel

public class UserEntitySpec: QuickSpec {
    
    public override func spec() {
        describe("User Entity Spec", {
            it("constructor returns an instance of UserEntity") {
                
                let FAKE_USERNAME = "octocat"
                let FAKE_URL = "http://test.com"
                
                let user = UserEntity(name: FAKE_USERNAME, avatarUrl: FAKE_URL)
                
                expect(user.name).to(equal(FAKE_USERNAME))
                expect(user.avatarUrl).to(equal(FAKE_URL))
            }
            
            it("has a mapper to parse instances from a JSON array"){
                
                let DUMMY_NAME = "octocat"
                let DUMMY_AVATAR_URL = "https://github.com/images/error/octocat_happy.gif"
                
                let user: UserEntity = UserEntity(dictionary: Dummy.dummyUserJson)!
                
                expect(user.name).to(equal(DUMMY_NAME))
                expect(user.avatarUrl).to(equal(DUMMY_AVATAR_URL))
            }
        })
    }
}