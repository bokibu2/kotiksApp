//
//  AppDelegate.swift
//  KotBook
//
//  Created by Александр Нехай on 12/21/19.
//  Copyright © 2019 kotiki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboardName = UserDefaults.standard.bool(forKey: "landingShowed") ? "Main" : "Landing"
        let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

