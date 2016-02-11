//
//  BuildTableViewController.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import UIKit
import TVViewModel

import RxSwift
import Swinject

public final class BuildTableViewController: UITableViewController {

    var repoSlug: String?
    
    let disposeBag = DisposeBag()
    
    public var viewModel: BuildTableViewModeling?

    public override func viewDidLoad() {
        if let viewModel = viewModel {
            viewModel.loadBuilds(repoSlug!).observeOn(MainScheduler.instance)
                .bindTo(tableView.rx_itemsWithCellIdentifier("BuildTableViewCell", cellType: BuildTableViewCell.self)) { _, viewModel, cell in
                        cell.viewModel = viewModel
                    }
                .addDisposableTo(disposeBag)
        }
    }
    
}