//
//  ArticleDetailViewController.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 10/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var hudView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    
    var presenter: ArticleDetailPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.notifyViewWillAppear()
    }
    
}

extension ArticleDetailViewController: ArticleDetailViewInterface {
    
    func setupView() {
        guard let article = presenter?.getArticle() else { return }
        self.articleTitleLabel.text = article.title
        self.articleDescriptionLabel.text = article.description
        
        if let author = article.author {
            self.articleAuthorLabel.text = "Author: \(author)"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.hideLoading()
        })
        
        guard let image = article.image, let url = URL(string: image) else { return }
        
        self.articleImage.kf.setImage(with: url)
    }
    
    func setScreenTitle(with title: String) {
        self.title = title
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        hudView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
