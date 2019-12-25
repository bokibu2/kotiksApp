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
	
	/// Method to get Book Path form UserDefaults
	func getBookPath(_ name: String) -> String {
		return getBookEntity(dictionaryKey: name, key: "path")
	}
	
	/// Method to get Book Author form UserDefaults
	func getAuthorPath(_ name: String) -> String {
		return getBookEntity(dictionaryKey: name, key: "author")
	}
	
	/// Universal method that allows to get any entity form UserDefaults as String
	func getBookEntity(dictionaryKey: String, key: String) -> String {
		
		if let existEntity = UserDefaults.standard.object(forKey: key) {
			
			let entity = existEntity as! [String: String]
			return entity[dictionaryKey] ?? "Entity is nil"
			
		} else {
			return "Entity not found"
		}
	}
	
	
}
