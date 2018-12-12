//
//  ArticleDetailPresenterInterface.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation

protocol ArticleDetailPresenterInterface: class {
   
    func notifyViewLoaded()
    func notifyViewWillAppear()
    
    func getArticle() -> Articles?
    
}
