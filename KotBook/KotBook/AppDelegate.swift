//
//  AppDelegate.swift
//  KotBook
//
//  Created by Александр Нехай on 12/21/19.
//  Copyright © 2019 kotiki. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboardName = UserDefaults.standard.bool(forKey: "landingShowed") ? "Main" : "Landing"
        let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        #if DEBUG
        if let realm = try? Realm() {
            if realm.objects(BookEntity.self).count == 0 {
                let firstBook = BookEntity()
                firstBook.author = "Eric Weiner"
                firstBook.name = "The Geography of Bliss"
                firstBook.path = Bundle.main.path(forResource: "BookSample", ofType: "epub")!
                try? realm.write {
                    realm.add(firstBook)
                }
            }
            print("Realm database path - \(realm.configuration.fileURL?.path ?? "")")
        }
        #endif
        
        return true
    }
}

