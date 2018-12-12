//
//  ArticlesListRouter.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticlesListRouter {
    
    weak var presenter: ArticlesListPresenterInterface?
    internal var navigationController: UINavigationController?
    
}

extension ArticlesListRouter: ArticlesListRouterInfercace {
    
    func setNavigationController(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func popBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func presentPopup(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.navigationController?.visibleViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showArticleDetail(_ article: Articles) {
        guard let navigationController = self.navigationController else { return }
        
        let articleDetailController = ArticleDetailModuleCreation.createModule(using: navigationController, article: article)
        
        navigationController.pushViewController(articleDetailController, animated: true)
    }
    
}
