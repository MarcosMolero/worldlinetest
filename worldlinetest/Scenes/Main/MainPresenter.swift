//
//  MainPresenter.swift
//  worldlinetest
//
//  Created by Marcos Molero on 05/11/2018.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates

protocol MainPresentationLogic {
    func presentPointsOI(response: MainScene.GetPointsOI.Response)
}

class MainPresenter: MainPresentationLogic {
    
    weak var viewController: MainDisplayLogic?
    
    // MARK: Presentation logic
    func presentPointsOI(response: MainScene.GetPointsOI.Response) {
        let viewModel = mapResponseToViewModel(response: response)
        viewController?.displayPointsOI(viewModel: viewModel)
    }
    
    func mapResponseToViewModel(response: MainScene.GetPointsOI.Response) -> MainScene.GetPointsOI.ViewModel {
        let displayPointsOI = mapPointsOIToDisplayPointsOI(pointsOI: response.pointsOI)
        return MainScene.GetPointsOI.ViewModel(displayPointsOI: displayPointsOI)
    }
    
    func mapPointsOIToDisplayPointsOI(pointsOI: [PointOI]) -> [MainScene.GetPointsOI.DisplayPointOI] {
        var displayPointsOI: [MainScene.GetPointsOI.DisplayPointOI] = []
        
        for item in pointsOI {
            
            // TODO: Check if the optional values are nil
            
            let displayPointOI = MainScene.GetPointsOI.DisplayPointOI(id: item.id, title: item.title!, latitude: item.latitude!, longitude: item.longitude!)
            displayPointsOI.append(displayPointOI)
        }
        

        return displayPointsOI
    }
    
    
}
