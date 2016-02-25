//
//  ColorPalette.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 16/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation
import UIKit

/// Transform Hex Colors to UIColors
public class ColorPalette {
    
    static let primaryColor = ColorPalette.colorWithHexString("#4CAF50"),
    primary_darkColor = ColorPalette.colorWithHexString("#388E3C"),
    primary_lightColor = ColorPalette.colorWithHexString("#C8E6C9"),
    accentColor = ColorPalette.colorWithHexString("#FF5252"),
    primary_textColor = ColorPalette.colorWithHexString("#212121"),
    secondary_textColor = ColorPalette.colorWithHexString("#727272"),
    iconsColor = ColorPalette.colorWithHexString("#FFFFFF"),
    dividerColor = ColorPalette.colorWithHexString("#B6B6B6")
    
    static func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString[cString.startIndex.advancedBy(1)...cString.startIndex.advancedBy(6)]
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = cString[cString.startIndex.advancedBy(0)...cString.startIndex.advancedBy(1)]
        let gString = cString[cString.startIndex.advancedBy(2)...cString.startIndex.advancedBy(3)]
        let bString = cString[cString.startIndex.advancedBy(4)...cString.startIndex.advancedBy(5)]

        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r) / CGFloat(255.0), green: CGFloat(g) / CGFloat(255.0), blue: CGFloat(b) / CGFloat(255.0), alpha: CGFloat(255.0))
    }
}