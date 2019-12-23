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
//		getFilePath()
		
		if let file = Bundle.main.path(forResource: "BookSample", ofType: "epub"){
			print("File path : \(file)")
			filePath = "\(file)"
			bookReader.presentReader(parentViewController: self, withEpubPath: filePath, andConfig: bookReaderConfig)
			
		}
	}


	func getFilePath() {
		
//		print(filePath)
//		if let file = Bundle.main.path(forResource: "BookSample", ofType: "epub"){
//			print("File path : \(file)")
//			filePath = "\(file)"
//		}
		
	}
}
