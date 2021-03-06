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
            buildNumberLabel.text = "Build #"+(viewModel?.number)!
            branchLabel.text = viewModel?.branchText
            statusLabel.text = viewModel?.statusText
            
            let resultR:Bool = (viewModel?.result)!
            let color: UIColor = resultR ? ColorPalette.primary_darkColor : ColorPalette.accentColor
            
            resultView.backgroundColor = color
            buildNumberLabel.textColor = color
            buildNumberLabel.textColor = ColorPalette.primary_textColor
            branchLabel.textColor = ColorPalette.secondary_textColor
        }
    }

    @IBOutlet weak var buildNumberLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var resultView: UIView!
    
}