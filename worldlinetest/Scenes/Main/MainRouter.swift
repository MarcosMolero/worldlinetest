//
//  MainRouter.swift
//  worldlinetest
//
//  Created by Marcos Molero on 05/11/2018.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates

import UIKit

protocol MainRoutingLogic {
    func routeToDetail()
}

protocol MainDataPassing {
    func passDataToNextScene(for segue:UIStoryboardSegue)
    var dataStore: MainDataStore? { get }
}

class MainRouter: MainRoutingLogic, MainDataPassing {
    
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    struct SegueIdentifiers {
        static let showDetail = "showDetail"
    }
    
    // MARK: Navigation
    func routeToDetail() {
        viewController?.performSegue(withIdentifier: SegueIdentifiers.showDetail, sender: nil)
    }
    // MARK: Communication
    
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        guard let segueIndentifier = segue.identifier else {
            return
        }
        
        switch segueIndentifier {
        case SegueIdentifiers.showDetail:
            passDataToDetailScene(for: segue)
        default:
            return
        }
    }
    
    func passDataToDetailScene(for segue: UIStoryboardSegue) {
        if let detailViewController = segue.destination as? DetailViewController {
            var destinationDataStore = detailViewController.router?.dataStore
            destinationDataStore?.pointOI = dataStore?.selectedPointOI
        }
    }

}
