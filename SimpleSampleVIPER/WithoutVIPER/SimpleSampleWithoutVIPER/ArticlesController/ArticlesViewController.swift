//
//  ArticlesViewController.swift
//  SimpleSampleWithoutVIPER
//
//  Created by Marcos Lacerda on 04/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var articles: [Articles]?
    
    fileprivate var state: ViewState = .normal {
        didSet {
            self.setupView()
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.state = .loading
        self.fetchArticles()
    }
    
    // MARK: - UI
    fileprivate func initUI() {
        // Apply the customizations
        guard let navigationController = self.navigationController else { return }
        
        navigationController.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 18, weight: .black)]
        
        self.title = "Articles"
        
        self.setupTableView()
    }
    
    fileprivate func setupView() {
        switch state {
        case .loading:
            self.articlesTableView.isHidden = true
            self.activityIndicator.startAnimating()
            
            break
            
        case .error:
            self.activityIndicator.stopAnimating()
            self.articlesTableView.isHidden = true
            break
            
        default:
            self.articlesTableView.isHidden = false
            self.activityIndicator.stopAnimating()
            
            break
        }
    }
    
    fileprivate func setupTableView() {
        self.articlesTableView.register(UINib(nibName: "ArticlesTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticlesCell")
        
        self.articlesTableView.estimatedRowHeight = 64
        self.articlesTableView.rowHeight = UITableView.automaticDimension
    }

    fileprivate func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        guard let navigationController = self.navigationController else { return }
        
        navigationController.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func fetchArticles() {
        ArticlesServices.shared.fecthArticles { result in
            switch result {
            case .success(let articles):
                self.loadSuccess(articles)
                break
                
            case .error(let error):
                self.loadingError(error)
                break
            }
        }
    }
    
    internal func loadSuccess(_ articles: [Articles]) {
        self.articles = articles
        self.state = .normal
        
        self.articlesTableView.reloadData()
    }
    
    internal func loadingError(_ error: String) {
        self.state = .error
        self.articles = nil
        
        self.showAlert(title: "Ops", message: error)
    }

}

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = self.articles else { return 0 }
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesCell") as? ArticlesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.setup(with: articles![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
