//
//  UserTextView.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 23/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation

class UserTextField : UITextField {
    
    static func toUserTextField(uiTextField: UITextField) -> UserTextField {
        return uiTextField as! UserTextField
    }
    
    func setResult(result:Bool) {
        backgroundColor = result ? ColorPalette.primary_lightColor: ColorPalette.accentColor
        layer.borderColor = result ? ColorPalette.primary_darkColor.CGColor: ColorPalette.iconsColor.CGColor
        layer.borderWidth = 2.0
    }
    
    private func setBorder() {
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
    }
    
    func resetView() {
        backgroundColor=UIColor.whiteColor()
        layer.cornerRadius = 1.0
        layer.borderColor = UIColor.grayColor().CGColor
    }
}