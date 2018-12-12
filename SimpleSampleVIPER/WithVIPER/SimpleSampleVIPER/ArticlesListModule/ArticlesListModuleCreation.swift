//
//  ArticlesListModuleCreation.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticlesListModuleCreation {
    
    static func createModule() -> ArticlesListViewController {
        
        // Create layers
        let router = ArticlesListRouter()
        let presenter = ArticlesListPresenter()
        let interactor = ArticlesListInteractor()
        let view = ArticlesListViewController()
        
        // Connect layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        
        return view
        
    }

}
