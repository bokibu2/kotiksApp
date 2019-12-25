//
//  ReaderViewController.swift
//  KotBook
//
//  Created by Александр Нехай on 12/22/19.
//  Copyright © 2019 kotiki. All rights reserved.
//

import UIKit
import FolioReaderKit

class ReaderViewController: UIViewController {
	
	var bookReader = FolioReader()
	var bookReaderConfig = FolioReaderConfig()
	
	var filePath = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		//	TODO: Refactor following code -> Use Book class methods
		if let file = Bundle.main.path(forResource: "BookSample", ofType: "epub"){
			print("File path : \(file)")
			filePath = "\(file)"
			bookReader.presentReader(parentViewController: self, withEpubPath: filePath, andConfig: bookReaderConfig)
			
		}
	}
	
	//	MARK: Method to get Book Path form UserDefaults
	func getBookPath(_ name: String) -> String {
		
		if let existShelf = UserDefaults.standard.object(forKey: "path") {
			
			let shelf = existShelf as! [String: String]
			return shelf[name] ?? "Path is nil"
			
		} else {
			return "Path not found"
		}
	}
}
