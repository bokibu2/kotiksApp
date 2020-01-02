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
	
    var book: BookEntity!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
		if let filePath = book?.path {
			bookReader.presentReader(parentViewController: self, withEpubPath: filePath, andConfig: bookReaderConfig)
		}
	}
}
