//
//  SearchRouter.swift
//  worldlinetest
//
//  Created by Marcos Molero on 07/11/2018.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates

import UIKit

protocol SearchRoutingLogic {
    
}

protocol SearchDataPassing {
    func passDataToNextScene(for segue:UIStoryboardSegue)
    var dataStore: SearchDataStore? { get }
}

class SearchRouter: SearchRoutingLogic, SearchDataPassing {
    
    weak var viewController: SearchViewController?
    var dataStore: SearchDataStore?
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}
