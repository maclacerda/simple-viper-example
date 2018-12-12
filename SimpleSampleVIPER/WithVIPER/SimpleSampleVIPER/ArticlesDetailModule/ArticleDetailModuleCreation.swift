//
//  ArticleDetailModuleCreation.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticleDetailModuleCreation {
    
    static func createModule(using navigationController: UINavigationController, article: Articles) -> ArticleDetailViewController {
        
        // Create layers
        let router = ArticleDetailRouter()
        let presenter = ArticleDetailPresenter(article)
        let interactor = ArticleDetailInteractor()
        let view = ArticleDetailViewController()
        
        // Connect layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        router.navigationController = navigationController
        
        return view
        
    }
    
}

