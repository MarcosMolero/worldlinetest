//
//  PointOI.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

struct PointOI {
    let id: String
    let title: String?
    let address: String?
    let transport: String?
    let email: String?
    let latitude: String?
    let longitude: String?
    let description: String?
    let phone: String?
    
    init(id: String, title: String?, address: String?, transport: String?, email: String?, latitude: String?, longitude: String?, description: String?, phone: String?) {
        
        self.id = id
        self.title = title
        self.address = address
        self.transport = transport
        self.email = email
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.phone = phone
    }
}
