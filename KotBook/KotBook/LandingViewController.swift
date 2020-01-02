//
//  ViewController.swift
//  KotBook
//
//  Created by Александр Нехай on 12/21/19.
//  Copyright © 2019 kotiki. All rights reserved.
//

import UIKit


class LandingViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "landingShowed")
	}
    
    @IBAction func startReadingAction(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = viewController
    }
}

