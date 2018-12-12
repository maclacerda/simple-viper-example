//
//  ArticlesRouterInterface.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

protocol ArticlesListRouterInfercace {
    
    func setNavigationController(_ navigationController: UINavigationController?)
    
    func popBack()
    func presentPopup(with message: String)
    func showArticleDetail(_ article: Articles)
}
