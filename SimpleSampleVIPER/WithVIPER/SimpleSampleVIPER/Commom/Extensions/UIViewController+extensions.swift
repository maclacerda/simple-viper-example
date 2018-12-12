//
//  UIViewController+extensions.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var appdelegate: AppDelegate {
        get {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            return delegate
        }
    }
    
}
