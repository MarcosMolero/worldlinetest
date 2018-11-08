//
//  SearchPresenter.swift
//  worldlinetest
//
//  Created by Marcos Molero on 07/11/2018.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol SearchPresentationLogic {
    func presentPointsOIFromDB(response: SearchScene.GetPointsOIFromDB.Response)

}

class SearchPresenter: SearchPresentationLogic {
    
    weak var viewController: SearchDisplayLogic?
    
    // MARK: Presentation logic
    func presentPointsOIFromDB(response: SearchScene.GetPointsOIFromDB.Response) {
        let viewModel = mapResponseToViewModel(response: response)
        viewController?.displayPointsOI(viewModel: viewModel)
    }
    
    func mapResponseToViewModel(response: SearchScene.GetPointsOIFromDB.Response) -> SearchScene.GetPointsOIFromDB.ViewModel {
        let displayPointsOI = mapPointsOIToDisplayPointsOI(pointsOI: response.pointsOI)
        return SearchScene.GetPointsOIFromDB.ViewModel(displayPointsOI: displayPointsOI)
    }
    
    func mapPointsOIToDisplayPointsOI(pointsOI: [PointOI]) -> [SearchScene.GetPointsOIFromDB.DisplayPointOI] {
        var displayPointsOI: [SearchScene.GetPointsOIFromDB.DisplayPointOI] = []
        
        for item in pointsOI {
            let displayPointOI = SearchScene.GetPointsOIFromDB.DisplayPointOI(id: item.id, title: item.title!)
            displayPointsOI.append(displayPointOI)
        }
        
        return displayPointsOI
    }
    
    
}
