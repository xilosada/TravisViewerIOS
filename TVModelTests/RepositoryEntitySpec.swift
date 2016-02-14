//
//  RepositoryEntitySpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Quick
import Nimble

@testable import TVModel

public class RepositoryEntitySpec: QuickSpec {

    override public func spec() {
        describe("Repository entity from Travis-ci.org") {
            it("constructor happy case work as expected") {
                let repo = RepositoryEntity(id: 1, slug: "slug", description: "description")
                expect(repo.id) == 1
                expect(repo.slug).to(equal("slug"))
                expect(repo.description).to(equal("description"))
            }
            
            it("static mapper builds an array of repositories from a JSON Array") {
                let repos = try! RepositoryEntity.Mapper.parseJSONArray(Dummy.dummyRepositoriesJSON)
                expect(repos).toNot(beNil())
                expect(repos.count).to(beGreaterThan(0))
            }
        }
    }
}
