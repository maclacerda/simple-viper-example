//
//  ArticleDetailInteractor.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation

class ArticleDetailInteractor {
    
    weak var presenter: ArticleDetailPresenterInterface?
    
}

extension ArticleDetailInteractor: ArticleDetailInteractorInterface {}
