//
//  BookEntity.swift
//  KotBook
//
//  Created by Oleg Marchik on 1/2/20.
//  Copyright © 2020 kotiki. All rights reserved.
//

import Realm
import RealmSwift

final class BookEntity: Object {
    @objc dynamic var name = ""
    @objc dynamic var path = ""
    @objc dynamic var author = ""
    @objc dynamic var lastReadDate: Date?
    @objc dynamic var addedDate = Date()
}
