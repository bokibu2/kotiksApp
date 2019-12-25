//
//  Book.swift
//  KotBook
//
//  Created by Александр Нехай on 12/25/19.
//  Copyright © 2019 kotiki. All rights reserved.
//

import Foundation

class Book {
	
	var bookName: String?
	var bookPath: String?
	
	//	TODO: Create func that find (get) name of the book (API get or ect.)
	
	//	MARK: Method required for find File Path in app. Need to update if the directory of stored files will be updated.
	func findBookPath(_ name: String) {
		
		let lastElement = name.components(separatedBy: ".")[name.components(separatedBy: ".").count - 1]
		let bookName = name.components(separatedBy: ".\(lastElement)")[0]
		
		if let filePath = Bundle.main.path(forResource: bookName, ofType: lastElement){
			bookPath = filePath
		}
	}
	
	//	MARK: Method on save Book Name & Book Path to UserDafaults
	func saveBookPath(_ name: String,_ path: String) {
		
		if let existShelf = UserDefaults.standard.object(forKey: "path") {
			
			var shelf = existShelf as! [String: String]
			shelf[name] = path
			UserDefaults.standard.set(shelf, forKey: "path")
			
		} else {
			
			let newShelf = [name : path]
			UserDefaults.standard.set(newShelf, forKey: "path")
			
		}
	}
}
