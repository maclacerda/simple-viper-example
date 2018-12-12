//
//  ArticlesViewInterface.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

protocol ArticlesListViewInterface {
    
    func showLoading()
    func hideLoading()
    func reloadData()
    func setupView()
    func setScreenTitle(with title: String)
    func setNavigationController(_ navigationController: UINavigationController?)
    
}
