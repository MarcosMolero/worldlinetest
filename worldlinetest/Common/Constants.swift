//
//  Constants.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

struct Constants {
    
    struct API {
        
         static let BASE_URL = "http://t21services.herokuapp.com/"
        
        struct PointsOI {
            static let url = Constants.API.BASE_URL + "points"
        }
        
        struct PointOI {
            static let url = Constants.API.BASE_URL + "points/"
        }
    }
}
