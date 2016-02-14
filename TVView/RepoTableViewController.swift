//
//  RepoTableViewController.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//


import UIKit
import TVViewModel

import RxSwift

public final class RepoTableViewController:UITableViewController {
    
    public var viewModel: RepoTableViewModeling!
    
    let disposeBag = DisposeBag()

    public var repoName: String?{
        didSet {
            if let viewModel = viewModel {
                viewModel.loadRepos(repoName!).observeOn(MainScheduler.instance)
                    .bindTo(tableView.rx_itemsWithCellIdentifier("RepoTableViewCell", cellType: RepoTableViewCell.self)) {
                        (_, viewModel, cell) in
                        cell.viewModel = viewModel
                }.addDisposableTo(disposeBag)
            }
        }
    }
}

extension RepoTableViewController {
    public override func viewDidLoad() {
        tableView
            .rx_modelSelected(RepoTableViewCellModeling)
            .subscribeNext { value in
                self.performSegueWithIdentifier("showBuilds", sender:value.slug)
            }
            .addDisposableTo(disposeBag)
    }
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showBuilds"){
            let buildTableVC = segue.destinationViewController as! BuildTableViewController
            let data = sender as! String
            buildTableVC.repoSlug = data
        }
    }
}
