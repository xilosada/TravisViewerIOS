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
            if numberOfBuilds <= 0 {
                self.selectionStyle = UITableViewCellSelectionStyle.None
                self.userInteractionEnabled = false
                numberOfBuildsLabel.textColor = ColorPalette.accentColor
            } else {
                numberOfBuildsLabel.textColor = ColorPalette.primary_darkColor
            }
        }
    }
    @IBOutlet weak var numberOfBuildsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}