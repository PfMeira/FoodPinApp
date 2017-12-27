//
//  UINavigationController+Ext.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 26/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
