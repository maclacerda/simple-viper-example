//
//  ArticlesListPresenter.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticlesListPresenter {
    
    var interactor: ArticlesListInteractorInterface?
    var router: ArticlesListRouterInfercace?
    weak var view: ArticlesListViewController?
  
    fileprivate var articles: [Articles]?
    
}

extension ArticlesListPresenter: ArticlesListPresenterInterface {
    
    func notifyViewLoaded() {
        view?.setupView()
        view?.showLoading()
        interactor?.fetchArticlesList()
    }
    
    func setNavigationController(_ navigationController: UINavigationController?) {
        router?.setNavigationController(navigationController)
    }
    
    func notifyViewWillAppear() {
        view?.setScreenTitle(with: "Articles List")
    }
    
    func articleSelected(_ indexPath: IndexPath) {
        let article = articles![indexPath.row]
        router?.showArticleDetail(article)
    }
    
    func articlesListFetched(articles: [Articles]) {
        self.articles = articles
        view?.hideLoading()
        view?.reloadData()
    }
    
    func articlesListFetchFailed(with error: String) {
        router?.presentPopup(with: error)
    }
    
    func getArticles() -> [Articles]? {
        return articles
    }
  
}
