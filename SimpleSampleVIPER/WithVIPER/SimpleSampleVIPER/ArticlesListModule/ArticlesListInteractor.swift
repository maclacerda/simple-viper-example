//
//  ArticlesListInteractor.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation

class ArticlesListInteractor {
    
    weak var presenter: ArticlesListPresenterInterface?
    
}

extension ArticlesListInteractor: ArticlesListInteractorInterface {
    
    func fetchArticlesList() {
        ArticlesServices.shared.fecthArticles { [weak self] result in
            switch result {
                case .success(let articles):
                    self?.presenter?.articlesListFetched(articles: articles)
                
                case .error(let error):
                    self?.presenter?.articlesListFetchFailed(with: error)
            }
        }
    }
    
}
