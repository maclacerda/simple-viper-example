//
//  ArticlesListViewController.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticlesListViewController: UIViewController {
    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: ArticlesListPresenterInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.notifyViewWillAppear()
    }
    
}

extension ArticlesListViewController: ArticlesListViewInterface {
    
    func setupView() {
        self.setNavigationController(self.navigationController)
        
        self.articlesTableView.register(UINib(nibName: "ArticlesListTableViewCell", bundle: nil), forCellReuseIdentifier: ArticlesListTableViewCell.kReuseIdentifier)
    }
    
    func setNavigationController(_ navigationController: UINavigationController?) {
        self.presenter?.setNavigationController(navigationController)
    }
    
    func setScreenTitle(with title: String) {
        self.title = title
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
    }
    
    func reloadData() {
        articlesTableView.reloadData()
    }
    
}

extension ArticlesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = presenter?.getArticles() else { return 0 }
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesListTableViewCell.kReuseIdentifier) as? ArticlesListTableViewCell else {
            fatalError()
        }
        
        cell.selectionStyle = .none
        
        let article = presenter!.getArticles()![indexPath.row]
        
        cell.setup(with: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.articleSelected(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
  
}
