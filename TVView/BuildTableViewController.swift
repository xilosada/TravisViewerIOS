//
//  BuildTableViewController.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import UIKit
import TVViewModel

import RxCocoa
import RxSwift

public final class BuildTableViewController: UITableViewController {

    var repoId: Int?
    
    let disposeBag = DisposeBag()
    
    public var viewModel: BuildTableViewModeling?

    public override func viewDidLoad() {
        tableView.allowsSelection = false
        if let viewModel = viewModel {
            viewModel.getBuilds(repoId!).observeOn(MainScheduler.instance)
                .bindTo(tableView.rx_itemsWithCellIdentifier("BuildTableViewCell", cellType: BuildTableViewCell.self)) { _, viewModel, cell in
                        cell.viewModel = viewModel
                    }
                .addDisposableTo(disposeBag)
        }
    }
    
}