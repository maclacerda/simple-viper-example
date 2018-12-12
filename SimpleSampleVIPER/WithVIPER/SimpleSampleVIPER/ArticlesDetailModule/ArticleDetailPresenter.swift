//
//  ArticleDetailPresenter.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation

class ArticleDetailPresenter {
    
    var interactor: ArticleDetailInteractorInterface?
    var router: ArticleDetailRouterInterface?
    weak var view: ArticleDetailViewController?
    
    fileprivate var article: Articles?
    
    init(_ article: Articles) {
        self.article = article
    }
    
}

extension ArticleDetailPresenter: ArticleDetailPresenterInterface {
    
    func getArticle() -> Articles? {
        return article
    }
    
    
    func notifyViewLoaded() {
        view?.setupView()
        view?.showLoading()
    }
    
    func notifyViewWillAppear() {
        view?.setScreenTitle(with: "Article Detail")
    }
    
}

