//
//  AlertView.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 23/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation
import UIKit

public class NetworkAlert {
    
    public static func showErrorAlert(controller:UIViewController,onClosed:()->Void) {
        let alert = UIAlertController(
            title: "Network Error",
            message: "The Internet connection appears to be offline.",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) {
            (UIAlertAction) -> Void in
            onClosed()
        }
        alert.addAction(alertAction)
        controller.presentViewController(alert, animated: true) { () -> Void in }
    }
}