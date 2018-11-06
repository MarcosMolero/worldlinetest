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
    @objc dynamic var address: String?
    @objc dynamic var transport: String?
    @objc dynamic var email: String?
    @objc dynamic var desc: String?
    @objc dynamic var phone: String?
    
//    init(id: String, title: String, latitude: String, longitude: String) {
//        self.id = id
//        self.title = title
//        self.latitude = latitude
//        self.longitude = longitude
//    }
    
}
