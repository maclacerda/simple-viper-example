//
//  AppDelegate.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 04/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initRootViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
    
    // MARK: - Private methods
    
    internal func initRootViewController() {
        initWindow()
        
        let articlesListController = ArticlesListModuleCreation.createModule()
        
        self.window?.rootViewController = UINavigationController(rootViewController: articlesListController)
    }
    
    internal func initWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
    }

}
