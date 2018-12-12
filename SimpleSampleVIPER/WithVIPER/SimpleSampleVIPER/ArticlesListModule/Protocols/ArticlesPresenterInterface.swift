//
//  ArticlesPresenterInterface.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

protocol ArticlesListPresenterInterface: class {
    
    func notifyViewLoaded()
    func notifyViewWillAppear()
    func articleSelected(_ indexPath: IndexPath)
    
    func articlesListFetched(articles: [Articles])
    func articlesListFetchFailed(with error: String)

    func getArticles() -> [Articles]?
    
    func setNavigationController(_ navigationController: UINavigationController?)
}
