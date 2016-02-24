//
//  AppDelegateSpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 10/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import Quick
import Nimble
import Swinject
import TVModel
import TVViewModel
import TVView

@testable import TravisViewerIOS

class AppDelegateSpec: QuickSpec {
    override func spec() {
        var container: Container!
        beforeEach {
            container = AppDelegate().container
        }
        
        describe("Container") {
            it("resolves every service type.") {
                // Models
                expect(container.resolve(Networking.self)).notTo(beNil())
                
                // ViewModels
                expect(container.resolve(BuildTableViewModeling.self))
                    .notTo(beNil())
                
                expect(container.resolve(RepoTableViewModeling.self))
                    .notTo(beNil())
            }
            it("injects view models to views.") {
                let bundle = NSBundle(forClass: BuildTableViewController.self)
                let storyboard = SwinjectStoryboard.create(
                    name: "Main",
                    bundle: bundle,
                    container: container)
                let buildTableViewController = storyboard
                    .instantiateViewControllerWithIdentifier("BuildTableViewController")
                    as! BuildTableViewController
                
                expect(buildTableViewController.viewModel).notTo(beNil())
            }
        }
    }
}