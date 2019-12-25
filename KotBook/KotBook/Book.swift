//
//  Book.swift
//  KotBook
//
//  Created by Александр Нехай on 12/25/19.
//  Copyright © 2019 kotiki. All rights reserved.
//

import Foundation

class Book {
	
	var name: String?
	var path: String?
	var author: String?
	
	//	TODO: Create func that find (get) name of the book (API get or ect.)
	
	/// Method required for find File Path in app. Need to update if the directory of stored files will be updated.
	func findBookPath(_ name: String) {
		
		let bookNameSeparated = name.components(separatedBy: ".")
		let fileExtention = bookNameSeparated[bookNameSeparated.count - 1]
		let bookName = name.components(separatedBy: ".\(fileExtention)")[0]
		
		if let filePath = Bundle.main.path(forResource: bookName, ofType: fileExtention){
			path = filePath
		}
	}
	
	/// Method on save Book Name & Book Path to UserDafaults
	func saveBookPath(_ name: String,_ path: String) {
		saveBookEntity(dictionaryKey: name, dictionaryValue: path, key: "path")
	}
	
	/// Method on save Book Name & Book Author to UserDafaults
	func saveBookAuthor(_ name: String,_ author: String) {
		saveBookEntity(dictionaryKey: name, dictionaryValue: author, key: "author")
	}
	
	/// Universal method that allows to save any entity to User Defaults as Dictionary
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
