//
//  PointOIRealm.swift
//  worldlinetest
//
//  Created by Marcos Molero on 06/11/2018.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import RealmSwift

class PointOIRealm: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var title: String?
    @objc dynamic var latitude: String?
    @objc dynamic var longitude: String?

//    init(id: String, title: String, latitude: String, longitude: String) {
//        self.id = id
//        self.title = title
//        self.latitude = latitude
//        self.longitude = longitude
//    }
    
}
