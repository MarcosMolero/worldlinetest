//
//  PointOI+Network.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

extension PointOI {
    
    init?(fromDictionary dictionary: Dictionary<String, Any>) {
        
        guard let id = dictionary["id"] as? String else {
            return nil
        }
        
        self.id = id
        self.title = dictionary["title"] as? String
        self.address = dictionary["address"] as? String
        self.transport = dictionary["transport"] as? String
        self.email = dictionary["email"] as? String

        self.description = dictionary["description"] as? String
        self.phone = dictionary["phone"] as? String
        
        let geocoordinates = dictionary["geocoordinates"] as? String
        let geoSpit = geocoordinates?.components(separatedBy: ",")
        self.latitude = geoSpit?[0]
        self.longitude = geoSpit?[1]
    }
}
