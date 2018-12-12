//
//  ArticleDetailViewInterface.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation

protocol ArticleDetailViewInterface: class {
    
    func showLoading()
    func hideLoading()
    func setupView()
    func setScreenTitle(with title: String)
    
}
