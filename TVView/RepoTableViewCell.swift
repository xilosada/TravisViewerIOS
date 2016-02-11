//
//  RepoTableViewCell.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import TVViewModel

internal final class RepoTableViewCell: UITableViewCell {
    
    
    internal var viewModel: RepoTableViewCellModeling? {
        didSet {
            nameLabel.text = viewModel?.slug
            descriptionLabel.text = viewModel?.description
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}