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
	var bookAuthor: String?
	
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
		saveBookEntity(dictionaryKey: name, dictionaryValue: path, key: "path")
	}
	
	//	MARK: Method on save Book Name & Book Author to UserDafaults
	func saveBookAuthor(_ name: String,_ author: String) {
		saveBookEntity(dictionaryKey: name, dictionaryValue: author, key: "author")
	}
	
	// MARK: Method that allows to save any entity to User Defaults as Dictionary
	func saveBookEntity(dictionaryKey: String, dictionaryValue: String, key: String) {
		
		if let existEntity = UserDefaults.standard.object(forKey: key) {
			
			var entity = existEntity as! [String: String]
			entity[dictionaryKey] = dictionaryValue
			UserDefaults.standard.set(entity, forKey: key)

		} else {
			
			let newEntity = [dictionaryKey : dictionaryValue]
			UserDefaults.standard.set(newEntity, forKey: key)
			
		}
	}
}
