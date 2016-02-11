//
//  BuildTableViewCell.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import UIKit
import TVViewModel

internal final class BuildTableViewCell: UITableViewCell {
    
    internal var viewModel: BuildTableViewCellModeling? {
        didSet {
            buildNumberLabel.text = viewModel?.number
            branchLabel.text = viewModel?.branchText
            statusLabel.text = viewModel?.statusText
        }
    }

    @IBOutlet weak var buildNumberLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
}