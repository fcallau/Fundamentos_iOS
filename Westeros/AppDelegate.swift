//
//  AppDelegate.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 5/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Crear Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        // Creamos unos modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Creamos el controlador
        let houseDataSource = DataSources.housesDataSource(model: houses)
        let houseDelegate = Delegates.housesDelegate(model: houses)
        let housesVC = ArrayTableViewController(dataSource: houseDataSource,
                                                delegate: houseDelegate,
                                                title: "Houses",
                                                style: .plain).wrappedInNavigation()
        
        housesVC.tabBarItem = UITabBarItem(title: "Houses", image: UIImage.init(named: "littleHouses.png"), selectedImage: nil)
        
        let seasonDataSource = DataSources.seasonsDataSource(model: seasons)
        let seasonDelegate = Delegates.seasonsDelegate(model: seasons)
        let seasonsVC = ArrayTableViewController(dataSource: seasonDataSource,
                                                 delegate: seasonDelegate,
                                                 title: "Seasons",
                                                 style: .plain).wrappedInNavigation()
        
        seasonsVC.tabBarItem = UITabBarItem(title: "Seasons", image: UIImage.init(named: "littleSeasons.png"), selectedImage: nil)
        
        let tabBarController = UITabBarController()
        tabBarController.delegate = self as UITabBarControllerDelegate
        tabBarController.viewControllers = [housesVC, seasonsVC]
        
        // Asignamos el RootVC
        // window?.rootViewController = housesVC
        // window?.rootViewController = seasonsVC
        window?.rootViewController = tabBarController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    // MARK: - UITabBarControllerDelegate
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        (viewController as! UINavigationController).popToRootViewController(animated: false)
    }
}

