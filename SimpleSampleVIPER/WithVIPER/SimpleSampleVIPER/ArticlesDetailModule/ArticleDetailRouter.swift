//
//  ArticleDetailRouter.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticleDetailRouter {
    
    weak var presenter: ArticleDetailPresenterInterface?
    weak var navigationController: UINavigationController?
    
}

extension ArticleDetailRouter: ArticleDetailRouterInterface {
    
    func presentPopup(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.navigationController?.visibleViewController?.present(alertController, animated: true, completion: nil)
    }
    
}

