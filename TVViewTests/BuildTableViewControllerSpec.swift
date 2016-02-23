//
//  BuildTableViewControllerSpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
/*
import Quick
import Nimble
import RxSwift
import TVViewModel

@testable import TVView

class BuildTableViewControllerSpec: QuickSpec {
    // MARK: Mock
    class MockViewModel: BuildTableViewModeling {
        var startSearchCallCount = 0

        func getBuilds(repoId: Int) -> Observable<[BuildTableViewCellModeling]>{
            startSearchCallCount++
            return Observable.empty()
        }

    }
    
    // MARK: Spec
    override func spec() {
        it("starts searching images when the view is about to appear at the first time.") {
            let viewModel = MockViewModel()
            let storyboard = UIStoryboard(
                name: "Main",
                bundle: NSBundle(forClass: BuildTableViewController.self))
            let viewController = storyboard.instantiateViewControllerWithIdentifier(
                "BuildTableViewController")
                as! BuildTableViewController

            expect(viewController).toNot(beNil())
            
            viewController.repoId = 1
            viewController.viewModel = viewModel
            
            expect(viewModel.startSearchCallCount) == 0
            viewController.viewWillAppear(true)
            expect(viewModel.startSearchCallCount) == 1
        }
    }
}*/