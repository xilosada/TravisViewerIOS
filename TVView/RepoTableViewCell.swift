//
//  RepoTableViewCell.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import UIKit
import TVViewModel

internal final class RepoTableViewCell: UITableViewCell {
    
    
    internal var viewModel: RepoTableViewCellModeling? {
        didSet {
            let numberOfBuilds = (viewModel?.numberOfBuilds)!
            nameLabel.text = viewModel?.slug
            descriptionLabel.text = viewModel?.description
            numberOfBuildsLabel.text = "\(numberOfBuilds) builds"
            nameLabel.textColor = ColorPalette.primary_textColor
            descriptionLabel.lineBreakMode = .ByWordWrapping
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textColor = ColorPalette.secondary_textColor
            numberOfBuildsLabel.textColor = numberOfBuilds > 0 ? ColorPalette.primary_darkColor : ColorPalette.accentColor
        }
    }
    @IBOutlet weak var numberOfBuildsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}